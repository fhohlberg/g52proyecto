class AddClientsRatingsToRestaurantes < ActiveRecord::Migration[5.2]
  def change
    add_column :restaurantes, :clients_ratings, :string, array: true, default: []
  end
end
