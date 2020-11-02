class CreateOrders < ActiveRecord::Migration[5.2]
  def change
    create_table :orders do |t|
      t.text :plates
      t.integer :price
      t.string :payment
      t.text :address
      t.time :delivery_time
      t.string :status
      t.text :notes
      t.integer :restaurante_id
      t.integer :client_id

      t.timestamps
    end
  end
end
