class HitokotoWorker
  include Sidekiq::Worker
  include Uri

  sidekiq_options queue: :message
  # 一言
  def perform
    staff = Staff.first
    SendWorker.new.perform(words, staff)
  end

  private

  def words
    uri = URI.parse(HITOKOTO)
    response = Net::HTTP.start(uri.host, uri.port, use_ssl: uri.scheme == 'https', read_timeout: 2) do |http|
      req = Net::HTTP::Get.new uri
      http.request req
    end
    response = JSON.parse response.body
    country_code = response["hitokoto"]
  end
end
