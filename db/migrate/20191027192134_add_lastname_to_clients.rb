class AddLastnameToClients < ActiveRecord::Migration[5.2]
  def change
    add_column :clients, :lastname, :string
  end
end
