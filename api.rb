require 'grape'

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
            headings: request.url.gsub('status', 'headings')
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
          res[:size] = params[:size] || 10
          res[:headings] = Heading
            .desc(:created_at)
            .limit(res[:size])
            .scroll(params[:cursor]) do |record, next_cursor|
              res[:next] = next_cursor.to_s
            end
        end
      end

      desc 'Creates a heading.'

      params do
        requires :value, type: Float, desc: 'Compass heading.'
        requires :source, type: String
      end

      post do
        heading = Heading.create!(
          value: params[:value],
          source: params[:source],
          referer: request.referer,
          ip: env['HTTP_X_FORWARDED_FOR'] || env['REMOTE_ADDR']
        )

        heading.as_json
      end
    end
  end
end
