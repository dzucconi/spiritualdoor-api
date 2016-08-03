require 'grape'

module SpiritualDoor
  class API < Grape::API
    version 'v1', using: :header, vendor: 'Damon Zucconi'

    format :json
    prefix :api

    resource :status do
      get do
        {
          ip: env['REMOTE_ADDR'],
          referer: request.referer
        }
      end
    end

    resource :headings do

      desc 'Creates a heading.',
        params: Heading.fields.dup.tap { |fields| fields.delete('_id') }
      post do
        heading = Heading.create!(
          ip: env['REMOTE_ADDR'],
          referer: request.referer,
          value: params[:value]
        )
        heading.as_json
      end

    end
  end
end
