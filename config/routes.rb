Rails.application.routes.draw do
  # devise_for :users
  # # devise_for :users
  devise_for :users, skip: :all
  # devise_for :users, controllers: { sessions: 'users/sessions' }
  devise_for :users, path: 'auth', path_names: { sign_in: 'login', sign_out: 'logout', password: 'secret', confirmation: 'verification', unlock: 'unblock', registration: 'register', sign_up: 'cmon_let_me_in' }
  root "articles#index"
  # get "/articles", to: "comments#all"
  # get "/articles/:id", to: "articles#show"
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  resources :articles do
    resources :comments
  end
  devise_scope :user do
    get 'sign_in', to: 'devise/sessions#new'
  end
end