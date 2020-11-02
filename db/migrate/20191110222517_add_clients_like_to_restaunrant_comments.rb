class AddClientsLikeToRestaunrantComments < ActiveRecord::Migration[5.2]
  def change
    add_column :restaurant_comments, :clients_like, :string, array: true, default: []
  end
end
