class Send01Worker
  include Sidekiq::Worker
  sidekiq_options queue: :message
  # 08:55
  def perform
    Staff.all.each do |staff|
      words = "在？来上班！！!"
      SendWorker.new.perform(words, staff)
    end
  end
end
