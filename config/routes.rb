Rails.application.routes.draw do
  # EXAMPLE HTML ROUTE
  # get "/photos" => "photos#index"

  # EXAMPLE JSON ROUTE WITH API NAMESPACE
  namespace :api do
    get "/users" => "users#index"
    post "/users" => "users#create"
    get "/users/:id" => "users#show"
    patch "users/:id" => "users#edit"

    get "/artists" => "artists#index"
    get "/artists/:id" => "artists#show"
    patch "/artists/:id" => "artists#edit"

    get "/posts" => "posts#index"
  end
end
