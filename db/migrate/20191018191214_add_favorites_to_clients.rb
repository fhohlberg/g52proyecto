class AddFavoritesToClients < ActiveRecord::Migration[5.2]
  def change
    add_column :clients, :favs, :string, array: true, default: []
  end
end
