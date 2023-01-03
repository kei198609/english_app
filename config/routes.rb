Rails.application.routes.draw do
  get 'static_pages/home'
  devise_for :users
  # root to: 'pages#home'
end
