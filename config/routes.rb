Rails.application.routes.draw do
  post 'purchases/notification', to: 'my_moip_rails/purchases#notification'
end
