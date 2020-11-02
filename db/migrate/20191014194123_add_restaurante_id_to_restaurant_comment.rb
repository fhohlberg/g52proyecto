class AddRestauranteIdToRestaurantComment < ActiveRecord::Migration[5.2]
  def change
    add_column :restaurant_comments, :restaurante_id, :integer
  end
end
