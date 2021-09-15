class Send02Worker
  include Sidekiq::Worker
  sidekiq_options queue: :message
  # 12:25
  def perform
    Staff.all.each do |staff|
      words = "颜值在线的#{staff.name},是时候准备干饭了！！!"
      SendWorker.new.perform(words, staff)
    end
  end
end
