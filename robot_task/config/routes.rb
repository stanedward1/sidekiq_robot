require 'sidekiq/web'
require 'sidekiq-cron'
require 'sidekiq/cron/web'

Sidekiq::Web.use(Rack::Auth::Basic) do |user, password|
  [user, password] == ["admin", "longbiu"]
end

Rails.application.routes.draw do
  mount Sidekiq::Web => "/sidekiq"
  resources :staffs
end
