class Send04Worker
  include Sidekiq::Worker
  sidekiq_options queue: :message
  # 15:58
  def perform
    Staff.all.each do |staff|
      words = "#{staff.name}，准备吃下午茶了，帮我拿点水果可以嘛！！!"
      SendWorker.new.perform(words, staff)
    end
  end
end
