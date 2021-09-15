class Send03Worker
  include Sidekiq::Worker
  sidekiq_options queue: :message
  # 13:40
  def perform
    Staff.all.each do |staff|
      words = "#{staff.name}，醒来没，起来工作了！！!"
      SendWorker.new.perform(words, staff)
    end
  end
end
