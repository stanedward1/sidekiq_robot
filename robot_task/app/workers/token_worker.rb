class TokenWorker
  include Sidekiq::Worker
  include Uri

  def perform
    uri = URI.parse(TOKEN_URI)

    request = Net::HTTP::Post.new(uri)
        request.content_type = "application/json"
        request.body = JSON.dump({
                                     "app_id" => "#{APP_ID}",
                                     "app_secret" => "#{APP_SECRET}",
                                 })

        req_options = {
            use_ssl: uri.scheme == "https",
        }

    response = Net::HTTP.start(uri.hostname, uri.port, req_options) do |http|
      http.request(request)
    end
    return JSON.parse(response.body)["tenant_access_token"]
  end
end
