# frozen_string_literal: true

json.extract! plate, :id, :name, :price, :description, :portions, :image, :created_at, :updated_at
json.url plate_url(plate, format: :json)
