Rails.application.routes.draw do
  root to: 'memos#index'
  resources :memos
  resources :sample_memos
end
