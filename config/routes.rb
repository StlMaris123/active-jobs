require 'resque/server'
Rails.application.routes.draw do
  mount Resque::Server.new, at: '/resque'
  resources :articles
  resources :comments
  resource  :dashboard
  resource  :account, :only => [:show] do
    get :work
  end

  get '/login' => 'sessions#new'
  post '/login' => 'sessions#create'
  get '/logout' => 'sessions#destroy'

  root to: 'dashboard#show'
end
