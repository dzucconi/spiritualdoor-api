require 'grape'

def path_for(from, new_path)
  from.split('/').tap  { |url|
    url.pop
    url.push(new_path)
  }.join('/')
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
        {
          ip: env['HTTP_X_FORWARDED_FOR'] || env['REMOTE_ADDR'],
          referer: request.referer,
          endpoints: {
            headings: path_for(request.url, 'headings')
          }
        }
      end
    end

    resource :headings do
      desc 'Returns all the headings'

      params do
        optional :size, type: Integer, desc: 'Number of results to return.'
        optional :cursor, type: String, desc: 'Cursor returned from `next`.'
      end

      get do
        {}.tap do |res|
          res[:headings] = Heading
            .desc(:created_at)
            .limit(res[:size])
            .scroll(params[:cursor]) do |_, next_cursor|
              res[:next] = {
                url: path_for(request.url, "headings?next=#{next_cursor.to_s}"),
                cursor: next_cursor.to_s
              }
            end
        end
      end

      desc 'Creates a heading.'

      params do
        requires :value, type: Float, desc: 'Compass heading.'
        optional :rate, type: Integer
      end

      post do
        heading = Heading.create!(
          value: params[:value],
          rate: params[:rate],
          referer: request.referer,
          ip: env['HTTP_X_FORWARDED_FOR'] || env['REMOTE_ADDR']
        )

        heading.as_json
      end
    end
  end
end
