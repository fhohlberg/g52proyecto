class AddClientIdToRestaurantes < ActiveRecord::Migration[5.2]
  def change
    add_column :restaurantes, :client_id, :integer
  end
end
