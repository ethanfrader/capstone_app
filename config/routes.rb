Rails.application.routes.draw do
  # EXAMPLE HTML ROUTE
  # get "/photos" => "photos#index"

  # EXAMPLE JSON ROUTE WITH API NAMESPACE
  namespace :api do
    post "/sessions" => "sessions#create" #login

    get "/users" => "users#index"
    post "/users" => "users#create" #signup
    get "/users/:id" => "users#show"
    patch "users/:id" => "users#edit"

    get "/artists" => "artists#index"
    post "/artists" => "artists#create"
    get "/artists/:id" => "artists#show"
    patch "/artists/:id" => "artists#edit"
    delete "/artists/:id" => "artists#destroy"

    get "/posts" => "posts#index"
    post "/posts" => "posts#create"
    get "/posts/:id" => "posts#show"
    delete "/posts/:id" => "posts#destroy"

    get "/images" => "images#index"
    get "/images/:id" => "images#show"
  end
end
