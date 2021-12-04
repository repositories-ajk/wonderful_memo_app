Rails.application.routes.draw do
  root to: 'memos#index'
  get '/mypage', to: 'mypage#index'
  devise_for :users
  resources :memos

end
