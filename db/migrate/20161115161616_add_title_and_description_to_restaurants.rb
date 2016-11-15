class AddTitleAndDescriptionToRestaurants < ActiveRecord::Migration[5.0]
  def change
    add_column :restaurants, :title, :string
    add_column :restaurants, :description, :text
  end
end
