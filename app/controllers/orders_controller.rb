class OrdersController < ApplicationController
  before_action :set_order, only: [:accept, :decline, :cooking, :sent, :delivered, :show, :add_plates, :edit, :update, :destroy]
  before_action :set_restaurante, only: %i[accept decline cooking sent delivered index show add_plates new create edit update destroy]
  before_action :authenticate_client!, only: [:index, :new, :show, :edit, :create, :update, :destroy]
  before_action :check_owner, only: [:index]
  # GET /orders
  # GET /orders.json
  def index
    @orders = @restaurante.orders
  end


  def add_plates
    plate_selected = Plate.find(params[:id_plate])
    if plate_selected.quantity.nil?
      plate_selected.quantity = 0
    end

    if @order.order_plates.find_by(plate_id: plate_selected.id).nil? && (params[:portions].to_i != 0)
      @order.plates << plate_selected
      order_of_plate = @order.order_plates.find_by(plate_id: plate_selected.id)
      order_of_plate.update(plates_quantity: params[:portions].to_i)
      plate_selected.quantity += params[:portions].to_i

    elsif params[:portions].to_i == 0 && (@order.plates.include? plate_selected)
      plate_change = @order.plates.find(params[:id_plate].to_i)
      plate_selected.quantity -= plate_change.quantity
      @order.plates.delete(plate_change)

    elsif params[:portions] != 0 && (@order.plates.include? plate_selected)
      order_of_plate = @order.order_plates.find_by(plate_id: plate_selected.id)
      plate_selected.quantity -= order_of_plate.plates_quantity
      plate_selected.quantity += params[:portions].to_i
      order_of_plate.update(plates_quantity: params[:portions].to_i)
    end

    @order.save()
    plate_selected.save
    redirect_to restaurante_order_path(@restaurante, @order)
  end

  # GET /orders/1
  # GET /orders/1.json
  def show
    @plates = @restaurante.plates
    if @order.plates.nil?
      @order.price = 0
    else
      @order.plates.each do |p|
        @order.price += (p.price*@order.order_plates.find_by(plate_id: p).plates_quantity)
      end
    end
  end

  # GET /orders/new
  def new
    @order = Order.new
    @plates = @restaurante.plates
    @order.delivery_time = Time.now + ((60 * 15) + (5 * @order.platos.length()))
  end

  # GET /orders/1/edit
  def edit
    @plates = @restaurante.plates
  end

  def accept
    @order.status = "Aceptada"
    @order.delivery_time = Time.now + ((60 * 15) + (5 * @order.platos.length())) #se agrega 5 min por plato mas 15 minutos de envio
    @order.save()

    redirect_to restaurante_orders_path(@restaurante)
  end

  def decline
    @order.status = "Rechazada"
    @order.save()
    redirect_to restaurante_orders_path(@restaurante)
  end

  def cooking
    @order.status = "En Cocina"
    @order.save()
    redirect_to restaurante_orders_path(@restaurante)
  end

  def sent
    @order.status = "Enviada"
    @order.delivery_time = Time.now + (60 * 15)
    @order.save()
    redirect_to restaurante_orders_path(@restaurante)
  end

  def delivered
    @order.status = "Entregada"
    @order.delivery_time = Time.now
    @order.save()
    redirect_to restaurante_orders_path(@restaurante)
  end


  # POST /orders
  # POST /orders.json
  def create
    @order = @restaurante.orders.create(order_params)
    @order.client_id = current_client.id
    @order.status ||= "Pendiente"
    @order.price = 0
    @order.address ||= current_client.address
    @order.hash_platos ||= {}

    respond_to do |format|
      if @order.save
        format.html { redirect_to restaurante_order_path(@restaurante, @order), notice: 'Los datos de la orden fueron guardados.' }
        format.json { render :show, status: :created, location: @order }
      else
        format.html { render :new }
        format.json { render json: @order.errors, status: :unprocessable_entity}
      end
    end
  end

  # PATCH/PUT /orders/1
  # PATCH/PUT /orders/1.json
  def update
    respond_to do |format|
      if @order.update(order_params)
        format.html {redirect_to restaurante_order_path(@restaurante, @order)}
        format.json { render :show, status: :ok, location: @order }
      else
        format.html { render :edit }
        format.json { render json: @order.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /orders/1
  # DELETE /orders/1.json
  def destroy
    @order.destroy
    respond_to do |format|
      format.html { redirect_to my_orders_path(@restaurante.client_id), notice: 'La orden fue eliminada.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_order
      @order = Order.find(params[:id])
    end


    def set_restaurante
      @restaurante = Restaurante.find(params[:restaurante_id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def order_params
      params.require(:order).permit(:portions, :id_plate, :payment, :address, :delivery_time, :status, :notes, :restaurante_id, :client_id, :platos =>[],:price=>0)
    end


    def check_owner
      if !(current_client.id == @restaurante.client_id)
        redirect_to restaurante_path(@restaurante)
      end
    end

end
