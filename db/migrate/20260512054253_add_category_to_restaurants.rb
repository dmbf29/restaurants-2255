class AddCategoryToRestaurants < ActiveRecord::Migration[8.1]
  def change
    add_column :restaurants, :category, :string
  end
end
