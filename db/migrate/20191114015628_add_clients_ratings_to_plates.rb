class AddClientsRatingsToPlates < ActiveRecord::Migration[5.2]
  def change
    add_column :plates, :clients_ratings, :string, array: true, default: []
  end
end
