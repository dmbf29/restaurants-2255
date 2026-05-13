class Restaurant < ApplicationRecord
  # associations
  has_many :reviews, dependent: :destroy # restaurant.reviews
  # validations
  validates :name, presence: true
end

# by default on a has_many...
# the DB will not let me destroy a restaurant if it has reviews

# do i want to destroy those reviews when i destroy the restaurant?

# dependent: :destroy
# -> destroy all of the reviews when the restaurant is destroyed

# restaurant = Restaurant.find(13)
# restaurant.destroy # this will also destroy the reviews for that restaurant
