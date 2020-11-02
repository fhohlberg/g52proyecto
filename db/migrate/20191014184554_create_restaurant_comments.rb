class CreateRestaurantComments < ActiveRecord::Migration[5.2]
  def change
    create_table :restaurant_comments do |t|
      t.string :body
      t.string :client_name
      t.integer :client_id

      t.timestamps
    end
  end
end
