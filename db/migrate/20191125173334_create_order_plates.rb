class CreateOrderPlates < ActiveRecord::Migration[5.2]
  def change
    create_table :order_plates do |t|
      t.belongs_to :order, :null => false, :index => true
      t.belongs_to :plate, :null => false, :index => true

      t.timestamps
    end
  end
end
