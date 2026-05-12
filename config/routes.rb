Rails.application.routes.draw do
  # http_verb '/path', to: 'controller#action', as: :prefix (aka nickname)
  # The prefix ONLY refers to the path (not the http verb)
  # get, post, path, delete

  # CRUD
  # Read all
  get "/restaurants", to: "restaurants#index", as: :restaurants

  # Create
  # we need one action just for the form
  get "/restaurants/new", to: "restaurants#new", as: :new_restaurant
  # we need one action to receive the form data and create the instance
  post "/restaurants", to: "restaurants#create"

  # Read one
  get "/restaurants/:id", to: "restaurants#show", as: :restaurant

  # Update
  # we need one action just for the form
  get "/restaurants/:id/edit", to: "restaurants#edit", as: :edit_restaurant
  # we need one action to receive the form data and update the instance
  patch "/restaurants/:id", to: "restaurants#update"

  # Destroy
  delete "/restaurants/:id", to: "restaurants#destroy"
end

# <%= link_to 'Home', restaurants_path %>
# <%= link_to 'Home', restaurant_path(restaurant), method: :delete %>
# <%= form restaurants_path method="post"%>
#
# <a href="restaurants_path"
# form restaurants_path method="post"
