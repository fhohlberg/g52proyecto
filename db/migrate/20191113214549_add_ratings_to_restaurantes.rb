class AddRatingsToRestaurantes < ActiveRecord::Migration[5.2]
  def change
    add_column :restaurantes, :ratings, :string, array: true, default: []
  end
end
