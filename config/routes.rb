Rails.application.routes.draw do
  root to: 'articles#index'
  get '/mypage', to: 'mypage#index'
  devise_for :users
  resources :articles

end
