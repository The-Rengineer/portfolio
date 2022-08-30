Rails.application.routes.draw do

  #For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  #homeのルーティング
  get "/" => "home#top"

  #postのルーティング
  get "posts/index" => "posts#index"
  get "posts/favorites_index" => "posts#favorites_index"
  get "posts/new" => "posts#new"
  get "posts/:post_id" => "posts#show"
  get "posts/:post_id/edit" => "posts#edit"
  post "posts/create" => "posts#create"
  post "posts/:post_id/update" => "posts#update"
  
  #userのルーティング
  # get "users/top" => "users#top" <= 必要か確認する
  get "users/new" => "users#new"
  get "users/login_form" => "users#login_form"
  post "users/create" => "users#create"
  post "users/login" => "users#login"
  post "users/logout" => "users#logout" 
  post "users/:user_id/destroy" => "users#destroy"
  
  #profileのルーティング
  get "profiles/:user_id" => "profiles#index"
  get "profiles/edit/:user_id" => "profiles#edit"
  post "profiles/create/:user_id" => "profiles#create"
  post "profiles/update/:user_id" => "profiles#update"

  #amessageのルーティング
  get "amessages/index" => "amessages#index"
  post "amessages/create" => "amessages#create"

  #roomのルーティング
  get "rooms/top" => "rooms#top"
  get "rooms/:room_id" => "rooms#new"
  post "rooms/create/:user_id" => "rooms#create"

  #chat_messagesのルーティング
  post "chat_messages/create/:room_id" => "chat_messages#create"

  #いいね非同期で追加
  post "favorite/:id" => "favorites#create", as: 'create_favorite'
  delete "favorite/:id" => "favorites#destroy", as: 'destroy_favorite'


  #adminのルーティング
  get "admin/index" => "admin#index"
  post "admin/:user_id/destroy" => "admin#destroy"
  post "admin/:user_id/update" => "admin#update"

end
