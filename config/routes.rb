Rails.application.routes.draw do
  # Resources is ONLY for CRUD routes
  resources :restaurants do
    resources :reviews, only: [ :new, :create ]
  end
  resources :reviews, only: [ :destroy ]
end
# Stay organized in our routing and group our routes together
# collection -> all of our restaurants (aka no need for an ID)
# member    -> one of our restaurants (aka need the id in the URL)

## This is a custom non-CRUD route
# get "/restaurants/top", to: "restaurants#top", as: :top_restaurants


# do
#   collection do
#     # http verb / action
#     get :top
#   end
#   member do
#     get :menu
#     get :navigate
#   end
# end
