# frozen_string_literal: true

require 'test_helper'

class RestaurantesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @restaurante = restaurantes(:one)
  end

  test 'should get index' do
    get restaurantes_url
    assert_response :success
  end

  test 'should get new' do
    get new_restaurante_url
    assert_response :success
  end

  test 'should create restaurante' do
    assert_difference('Restaurante.count') do
      post restaurantes_url, params: { restaurante: { adress: @restaurante.adress, mail: @restaurante.mail, name: @restaurante.name, phone_number: @restaurante.phone_number, valoration: @restaurante.valoration } }
    end

    assert_redirected_to restaurante_url(Restaurante.last)
  end

  test 'should show restaurante' do
    get restaurante_url(@restaurante)
    assert_response :success
  end

  test 'should get edit' do
    get edit_restaurante_url(@restaurante)
    assert_response :success
  end

  test 'should update restaurante' do
    patch restaurante_url(@restaurante), params: { restaurante: { adress: @restaurante.adress, mail: @restaurante.mail, name: @restaurante.name, phone_number: @restaurante.phone_number, valoration: @restaurante.valoration } }
    assert_redirected_to restaurante_url(@restaurante)
  end

  test 'should destroy restaurante' do
    assert_difference('Restaurante.count', -1) do
      delete restaurante_url(@restaurante)
    end

    assert_redirected_to restaurantes_url
  end
end
