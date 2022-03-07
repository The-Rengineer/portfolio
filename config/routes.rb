Rails.application.routes.draw do

  
  #For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  #homeのルーティング
  get "/" => "home#top"

  #postのルーティング
  get "posts/index" => "posts#index"
  get "posts/new" => "posts#new"
  get "posts/:post_id" => "posts#show"
  get "posts/:post_id/edit" => "posts#edit"
  post "posts/create" => "posts#create"
  post "posts/:post_id/update" => "posts#update"
  post "posts/:post_id/destroy" => "posts#destroy"

  #likeのルーティング
  get "likes/index" => "likes#index"
  post "likes/:post_id/create" => "likes#create"
  post "likes/:post_id/destroy" => "likes#destroy"
  

  #userのルーティング
  # get "users/top" => "users#top" <= 必要か確認する
  get "users/new" => "users#new"
  get "users/login_form" => "users#login_form"
  post "users/create" => "users#create"
  post "users/login" => "users#login"
  post "users/logout" => "users#logout" 
  
  #profileのルーティング
  get "profiles/:user_id" => "profiles#index"
  get "profiles/edit/:user_id" => "profiles#edit"
  post "profiles/create" => "profiles#create"
  post "profiles/update" => "profiles#update"

end
