def path_for(from, new_path, params = {})
  from.split('/').tap do |url|
    url.pop
    url.push(new_path)
  end.join('/') +
    '?' + params.map { |k, v| "#{k}=#{v}" }.join('&')
end

def ip(env)
  env['HTTP_X_FORWARDED_FOR'] || env['REMOTE_ADDR']
end

def paginate(collection, name)
  { next: {} }.tap do |res|
    res[name] = []
    res[:total] = collection.count
    collection
      .limit(params[:limit])
      .scroll(params[:next]) do |record, next_cursor|
        res[name] << record if record
        res[:next] = {
          cursor: next_cursor.to_s,
          url: path_for(request.url, name, params.merge(next: next_cursor.to_s))
        }
      end
  end
end

module SpiritualDoor
  class API < Grape::API
    version 'v1', using: :header, vendor: 'Damon Zucconi'

    format :json

    get '/' do
      redirect '/api/status'
    end

    prefix :api

    resource :status do
      get do
        { ip: ip(env) }
      end
    end

    resource :ips do
      get do
        Heading.distinct(:ip)
          .as_json
      end
    end

    resource :fingerprints do
      get do
        Heading.distinct(:fingerprint)
          .as_json
      end
    end

    resource :headings do
      desc 'Returns the total counts'

      get '/counts' do
        if params[:ip]
          Heading.where(ip: params[:ip]).count
        elsif params[:fingerprint]
          Heading.where(fingerprint: params[:fingerprint]).count
        else
          Heading.count
        end
      end

      desc 'Returns all the headings'

      params do
        optional :limit, type: Integer, desc: 'Number of results to return.', default: 10
        optional :cursor, type: String, desc: 'Cursor returned from `next`.'
        optional :ip, type: String, desc: 'Optionally filter by IP.'
        optional :fingerprint, type: String, desc: 'Optionally filter by fingerprint.'
        optional :referer, type: String, desc: 'Optionally filter by referer'
      end

      get do
        headings = Heading.desc(:created_at)
        headings = headings.where(ip: params[:ip]) if params[:ip]
        headings = headings.where(fingerprint: params[:fingerprint]) if params[:fingerprint]
        headings = headings.where(referer: params[:referer]) if params[:referer]
        headings = paginate(headings, :headings)

        ips = headings[:headings].map(&:ip).uniq

        locations = ips.reduce({}) do |memo, ip|
          begin
            memo[ip] ||= Location.find_by(ip: ip)
          rescue Mongoid::Errors::DocumentNotFound
            # Ignore
          end
          memo
        end

        headings[:headings] = headings[:headings].map do |heading|
          heading.location = locations[heading.ip]
          heading
        end

        headings
      end

      desc 'Creates a heading.'

      params do
        requires :value, type: Float, desc: 'Compass heading.'
        requires :rate, type: Integer
        optional :fingerprint, type: String
        optional :ip, type: String, desc: 'Overwrite automatic IP'
      end

      post do
        heading = Heading.create!(
          value: params[:value],
          rate: params[:rate],
          fingerprint: params[:fingerprint],
          referer: request.referer,
          ip: (params[:ip] || ip(env)).split(',').first.strip
        )

        heading.as_json
      end
    end
  end
end
