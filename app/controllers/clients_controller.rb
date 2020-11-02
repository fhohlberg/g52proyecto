class ClientsController < ApplicationController
  before_action :set_client, only: [:show]
  before_action :authenticate_client!, only: [:show]
  before_action :check_owner, only: [:show]
  before_action :authenticate_admin!, only: [:destroy]

  def show
  end

  def myorders
    @orders = current_client.orders
  end

  def myfavs
    @rest_favs ||= []
    current_client.favs.each do |f|
      @rest_favs << Restaurante.find(f.to_i)
    end
  end

  def myrestaurants
    @restaurantes = Restaurante.all
  end

  def set_client
    @client = Client.find(params[:id])
  end

  def check_owner
    if !(current_client.id == @client.id)
      redirect_to root_path
    end
  end

  def destroy
    @client = Client.find(params[:id])
    @client.destroy
    redirect_to clients_path, notice: 'Cliente eliminado.'
  end
end
