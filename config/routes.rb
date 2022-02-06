Rails.application.routes.draw do
  get "posts/index" => "posts#index"
  get "posts/new" => "posts#new"
  get "posts/:id" => "posts#show"
  post "posts/create" => "posts#create"
  get "posts/:id/edit" => "posts#edit"
  post "posts/:id/update" => "posts#update"
  post "posts/:id/destroy" => "posts#destroy"

  get "/" => "home#top"

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
get "users/top" => "users#top"
get "users/new" => "users#new"
post "users/create" => "users#create"
get "users/login_form" => "users#login_form"
post "users/login" => "users#login"
post "users/logout" => "users#logout" 

end