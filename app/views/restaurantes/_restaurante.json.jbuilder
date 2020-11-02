# frozen_string_literal: true

json.extract! restaurante, :id, :name, :mail, :adress, :valoration, :phone_number, :created_at, :updated_at
json.url restaurante_url(restaurante, format: :json)
