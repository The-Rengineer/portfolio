Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
get "users/top" => "users#top"
get "users/new" => "users#new"
post "users/create" => "users#create"

end