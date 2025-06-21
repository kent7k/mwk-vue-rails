require 'json'

Rails.application.config.middleware.insert_before 0, Rack::Cors do
  allow do
    raw = ENV.fetch('API_CORS_ORIGINS', '[]')
    allowed_origins =
      begin
        JSON.parse(raw)
      rescue JSON::ParserError
        Rails.logger.warn("[CORS] API_CORS_ORIGINS が JSON ではありません: #{raw.inspect}")
        raw.split(',')
      end

    origins(*Array(allowed_origins).map(&:strip))
    resource '*',
             headers: :any,
             expose: %w[access-token uid client token-type expiry],
             methods: %i[get post put patch delete options head]
  end
end
