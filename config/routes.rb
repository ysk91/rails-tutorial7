Rails.application.routes.draw do
  root "hello#index"

  get 'static_pages/home'
  get 'static_pages/help'
  
end
