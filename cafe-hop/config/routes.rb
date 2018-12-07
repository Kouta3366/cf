Rails.application.routes.draw do
  get "login" => "users#login_form"
  post "login" => "users#login"
  post "logout" => "users#logout"
  get 'post/post_page'
  post 'post/create'
  get 'search/search_page'
  get 'search/search_area1'
  get 'search/search_ranking'
  get "search/:id" => "search#search_area2"
  post "search/like/:id/:id2" => "search#like"
  post "search/like2/:id" => "search#like2"
  get 'home/top'
  get "home/:id/show" => "home#show"
  get "home/:id/edit" => "home#edit"
  post "home/:id/update" => "home#update"
  post "home/:id/destroy" => "home#destroy"
  get "users/index" => "users#index"
  get "users/:id" => "users#show"
  get "signup" => "users#new"
  post "users/create" => "users#create"
  get "users/:id/edit" => "users#edit"
  post "users/:id/update" => "users#update"
  post "users/:id/destroy" => "users#destroy"
  get "users/:id/likes" => "users#likes"
  post "likes/:list_id/:id2/:id3/create" => "likes#create"
  post "likes/:list_id/:id2/:id3/destroy" => "likes#destroy"
end
