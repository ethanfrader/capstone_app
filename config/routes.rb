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

    get "/messages" => "messages#index"
    post "/messages" => "messages#create"

    get "/images" => "images#index"
    post "/images" => "images#create"
    get "/images/:id" => "images#show"
    get "/images/:id/edit" => "images#edit"
    delete "/images/:id" => "images#destroy"

    get "/music-links" => "music_links#index"
    post "/music-links" => "music_links#create"
    get "/music-links/:id" => "music_links#show"
    delete "/music-links/:id" => "music_links#destroy"
  end
end
