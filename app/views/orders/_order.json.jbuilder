json.extract! order, :id, :platos, :price, :payment, :address, :delivery_time, :status, :notes, :restaurante_id, :client_id, :created_at, :updated_at
json.url order_url(order, format: :json)
