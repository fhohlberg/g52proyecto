# frozen_string_literal: true

json.array! @restaurantes, partial: 'restaurantes/restaurante', as: :restaurante
