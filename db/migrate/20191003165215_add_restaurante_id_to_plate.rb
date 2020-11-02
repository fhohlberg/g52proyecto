class AddRestauranteIdToPlate < ActiveRecord::Migration[5.2]
  def change
    add_column :plates, :restaurante_id, :integer
  end
end
