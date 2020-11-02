# frozen_string_literal: true

class AddUsernameToClients < ActiveRecord::Migration[5.2]
  def change
    add_column :clients, :username, :string
  end
end
