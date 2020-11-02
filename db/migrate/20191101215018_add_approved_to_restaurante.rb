class AddApprovedToRestaurante < ActiveRecord::Migration[5.2]
  def change
    add_column :restaurantes, :approved, :boolean, null: false, default: false
  end
end
