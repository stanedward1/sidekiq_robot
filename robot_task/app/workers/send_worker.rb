class SendWorker
  include Sidekiq::Worker
  include Uri

  def perform(words, staff)
    uri = URI.parse(SEND_URI)

    begin
      request = Net::HTTP::Post.new(uri)
          request.content_type = "application/json"
          request["Authorization"] = "Bearer " + TokenWorker.new.perform
          request.body = JSON.dump({
                                    "content": "{\"text\":\"#{words}\"}",
                                    "msg_type": "text",
                                    "receive_id": "#{staff.user_id}"
                                  })

          req_options = {
              use_ssl: uri.scheme == "https",
          }

      response = Net::HTTP.start(uri.hostname, uri.port, req_options) do |http|
        http.request(request)
      end
      JSON.parse(response.body)
    rescue
      puts "can't send message"
    end
  end
end
