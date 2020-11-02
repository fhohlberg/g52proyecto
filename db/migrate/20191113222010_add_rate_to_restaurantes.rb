class AddRateToRestaurantes < ActiveRecord::Migration[5.2]
  def change
    add_column :restaurantes, :rate, :string
  end
end
