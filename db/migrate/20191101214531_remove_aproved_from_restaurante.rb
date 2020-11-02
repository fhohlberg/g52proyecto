class RemoveAprovedFromRestaurante < ActiveRecord::Migration[5.2]
  def change
    remove_column :restaurantes, :approved, :boolean
  end
end
