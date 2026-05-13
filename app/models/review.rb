class Review < ApplicationRecord
  # associations
  belongs_to :restaurant # create a method -> review.restaurant (read/write)
  # validations
  validates :content, presence: true
end
