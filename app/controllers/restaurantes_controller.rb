# frozen_string_literal: true
#
class RestaurantesController < ApplicationController
  before_action :set_restaurante, only: %i[rating delete_rating show edit update destroy favourites unfavourites]
  before_action :authenticate_client!, only: [:new, :edit, :create]
  before_action :check_owner, only: [:edit]
  before_action :check_destroyer, only: [:destroy, :update]

  # GET /restaurantes
  # GET /restaurantes.json
  def index
    @restaurantes = Restaurante.where(:approved => true).order(:name).paginate(page: params[:page], per_page: 4)
  end

  # GET /restaurantes/1
  # GET /restaurantes/1.json
  def show; end

  def plates
    @restaurante.plates
  end

  def quantity_orders plate
    c = 0
    @restaurante.orders.each do |ord|
      c += ord.count(plate)
    end
    c
  end

  def favourites
    current_client.favs ||= []
    current_client.favs << (@restaurante.id).to_s
    current_client.save()
    redirect_to restaurante_path(@restaurante)
  end

  def unfavourites
    current_client.favs.delete((@restaurante.id).to_s)
    current_client.save()
    redirect_to restaurante_path(@restaurante)
  end

  def  rating
    if params[:rate] == "Sin valoración"
      delete_rating()
    else
      if !(@restaurante.clients_ratings.include?(current_client.id.to_s))
        @restaurante.clients_ratings << current_client.id.to_s
        @restaurante.ratings << (params[:rate]).to_s
      else
        @index = @restaurante.clients_ratings.find_index(current_client.id.to_s)
        @restaurante.ratings[@index] = params[:rate].to_s
      end
      @restaurante.valoration1 = 0
      @restaurante.ratings.each do |r|
        @restaurante.valoration1 += r.to_i
      end
      if @restaurante.ratings.length() != 0
        @restaurante.valoration1 = @restaurante.valoration1 / @restaurante.ratings.length()
      end
      @restaurante.save()
      redirect_to restaurante_path(@restaurante)
    end
  end

  def delete_rating
    if @restaurante.clients_ratings.include?(current_client.id.to_s)
      @index = @restaurante.clients_ratings.find_index(current_client.id.to_s)
      @restaurante.clients_ratings.delete_at(@index)
      @restaurante.ratings.delete_at(@index)
      @restaurante.valoration1 = 0
      @restaurante.ratings.each do |r|
        @restaurante.valoration1 += r.to_i
      end
      if @restaurante.ratings.length() != 0
        @restaurante.valoration1 = @restaurante.valoration1 / @restaurante.ratings.length()
      end
      @restaurante.rate = nil
      @restaurante.save()
    end

    redirect_to restaurante_path(@restaurante)
  end


  def accept
    @restaurante = Restaurante.find(params[:id])
    @restaurante.approved = true
    @restaurante.save()
    redirect_to pendings_path
  end
  # GET /restaurantes/new
  def new
    @restaurante = Restaurante.new
  end

  # GET /restaurantes/1/edit
  def edit; end

  # POST /restaurantes
  # POST /restaurantes.json
  def create
    @restaurante = Restaurante.new(restaurante_params)
    @restaurante.client_id = current_client.id

    respond_to do |format|
      if @restaurante.save
        format.html { redirect_to @restaurante,
          notice: 'Restaurante creado exitosamente.' }
        format.json { render :show, status: :created, location: @restaurante }
      else
        format.html { render :new }
        format.json { render json: @restaurante.errors,
          status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /restaurantes/1
  # PATCH/PUT /restaurantes/1.json
  def update

    respond_to do |format|
      if @restaurante.update(restaurante_params)
        if !(:rate_changed?)
          format.html { redirect_to @restaurante,
            notice: 'Restaurante actualizado exitosamente.' }
          format.json { render :show, status: :ok, location: @restaurante }
        else
          format.html {redirect_to @restaurante}
          format.json { render :show, status: :ok, location: @restaurante }
        end
      else
        format.html { render :edit }
        format.json { render json: @restaurante.errors,
          status: :unprocessable_entity }
      end
    end
  end

  # DELETE /restaurantes/1
  # DELETE /restaurantes/1.json
  def destroy
    @restaurante.destroy
    respond_to do |format|
      format.html { redirect_to restaurantes_url,
        notice: 'Restaurante eliminado exitosamente.' }
      format.json { head :no_content }
    end
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_restaurante
    @restaurante = Restaurante.find(params[:id])
  end

  # Never trust parameters from the scary internet,
  #only allow the white list through.
  def restaurante_params
    params.require(:restaurante).permit(:name, :mail,
      :adress, :valoration, :phone_number, :avatar, :approved, :rate)
  end

  def check_owner
    if !(current_client.id == @restaurante.client_id)
      redirect_to restaurante_path(@restaurante)
    end
  end

  def check_destroyer
    if current_client
      if !(current_client.id == @restaurante.client_id)
        redirect_to restaurante_path(@restaurante)
      end
    end
    if !(current_client) && !(current_admin)
      redirect_to new_client_session_path
    end
  end
end
