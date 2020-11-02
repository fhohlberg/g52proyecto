# frozen_string_literal: true
#
class PlatesController < ApplicationController
  before_action :set_restaurante, only: %i[rating delete_rating index show new create edit update destroy]
  before_action :set_plate, only: %i[rating delete_rating show edit update destroy]
  before_action :authenticate_client!, only: [:new, :edit, :create, :update]
  before_action :check_owner, only: [:new, :edit, :create, :update]
  before_action :check_destroyer, only: [:destroy]

  # GET /plates
  # GET /plates.json
  def index
    @plates = @restaurante.plates.order(:name).paginate(page: params[:page], per_page: 6)
  end

  def restaurante
    @restaurante
  end

  def quantity
    @quantity = @plates.quantity
  end

  def change_quantity portions
    @quantity += portions
  end

  def  rating
    @plate.ratings ||= []
    @plate.clients_ratings ||= []
    if params[:rate] == "Sin valoración"
      delete_rating()
    else
      if !(@plate.clients_ratings.include?(current_client.id.to_s))
        @plate.clients_ratings << current_client.id.to_s
        @plate.ratings << (params[:rate]).to_s
      else
        @index = @plate.clients_ratings.find_index(current_client.id.to_s)
        @plate.ratings[@index] = params[:rate].to_s
      end
      @plate.valoration = 0
      @plate.ratings.each do |r|
        @plate.valoration += r.to_i
      end
      if @plate.ratings.length() != 0
        @plate.valoration = @plate.valoration / @plate.ratings.length()
      end
      @plate.save()
      redirect_to restaurante_plate_path(@restaurante, @plate)
    end
  end

  def delete_rating
    if @plate.clients_ratings.include?(current_client.id.to_s)
      @index = @plate.clients_ratings.find_index(current_client.id.to_s)
      @plate.clients_ratings.delete_at(@index)
      @plate.ratings.delete_at(@index)
      @plate.valoration = 0
      @plate.ratings.each do |r|
        @plate.valoration += r.to_i
      end
      if @plate.ratings.length() != 0
        @plate.valoration = @plate.valoration / @plate.ratings.length()
      end
      @plate.rate = nil
      @plate.save()
    end

    redirect_to restaurante_plate_path(@restaurante, @plate)
  end
  # GET /plates/1
  # GET /plates/1.json
  def show;
  end

  # GET /plates/new
  def new
    @plate = Plate.new
  end

  # GET /plates/1/edit
  def edit;
  end

  # POST /plates
  # POST /plates.json
  def create
    @plate = @restaurante.plates.create(plate_params)
    @plate.ratings ||= []
    @plate.clients_ratings ||= []

    respond_to do |format|
      if @plate.save
        format.html { redirect_to restaurante_plate_path(@restaurante, @plate),
          notice: 'Plato creado exitosamente.' }
        format.json { render :show, status: :created, location: @plate }
      else
        format.html { render :new }
        format.json { render json: @plate.errors,
          status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /plates/1
  # PATCH/PUT /plates/1.json
  def update
    respond_to do |format|
      if @plate.update(plate_params)
        if !(:rate_changed?)
          format.html { redirect_to restaurante_plate_path(@restaurante, @plate),
            notice: 'Restaurante actualizado exitosamente.' }
          format.json { render :show, status: :ok, location: @restaurante }
        else
          format.html {redirect_to restaurante_plate_path(@restaurante, @plate)}
          format.json { render :show, status: :ok, location: @restaurante }
        end
      else
        format.html { render :edit }
        format.json { render json: @plate.errors,
          status: :unprocessable_entity }
      end
    end
  end

  # DELETE /plates/1
  # DELETE /plates/1.json
  def destroy
    @plate.destroy
    respond_to do |format|
      format.html { redirect_to restaurante_plates_path(@restaurante),
        notice: 'Plato eliminado.' }
      format.json { head :no_content }
    end
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_plate
    @plate = Plate.find(params[:id])
  end

  def set_restaurante
    @restaurante = Restaurante.find(params[:restaurante_id])
  end

  # Never trust parameters from the scary internet,
  #only allow the white list through.
  def plate_params
    params.require(:plate).permit(:name, :price,
      :description, :portions, :avatar, :rate)
  end

  def check_owner
    if !(current_client.id == @restaurante.client_id)
      redirect_to restaurante_plates_path(@restaurante)
    end
  end

  def check_destroyer
    if current_client
      if !(current_client.id == @restaurante.client_id)
        redirect_to restaurante_plates_path(@restaurante)
      end
    end
    if !(current_client) && !(current_admin)
      redirect_to new_client_session_path
    end
  end
end
