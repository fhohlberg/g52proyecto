class PlateCommentsController < ApplicationController
  before_action :set_restaurante, only: %i[like dislike index show new create edit update destroy]
  before_action :set_plate, only: %i[like dislike index show new create edit update destroy]
  before_action :set_plate_comment, only: [:like, :dislike, :show, :edit, :update, :destroy]
  before_action :authenticate_client!, only: [:new, :edit, :create, :update]
  before_action :check_owner, only: [:edit, :update]
  before_action :check_destroyer, only: [:destroy]

  # GET /plate_comments
  # GET /plate_comments.json
  def index
    @plate_comments = @plate.plate_comments
  end

  # GET /plate_comments/1
  # GET /plate_comments/1.json
  def show
  end

  def like
    @plate_comment.clients_like << current_client.id.to_s
    @plate_comment.save()
    redirect_to restaurante_plate_plate_comments_path(@restaurante, @plate)
  end

  def dislike
    @plate_comment.clients_like.delete(current_client.id.to_s)
    @plate_comment.save()
    redirect_to restaurante_plate_plate_comments_path(@restaurante, @plate)
  end

  # GET /plate_comments/new
  def new
    @plate_comment = PlateComment.new
  end

  # GET /plate_comments/1/edit
  def edit
  end

  # POST /plate_comments
  # POST /plate_comments.json
  def create
    @plate_comment = @plate.plate_comments.create(plate_comment_params)
    @plate_comment.client_id = current_client.id
    @plate_comment.client_name = current_client.username
    @plate_comment.avatar = current_client.avatar
    @plate_comment.clients_like ||= []

    respond_to do |format|
      if @plate_comment.save
        format.html { redirect_to restaurante_plate_plate_comments_path(@restaurante, @plate), notice: 'Comentario creado exitosamente.' }
        format.json { render :show, status: :created, location: @plate_comment }
      else
        format.html { render :new }
        format.json { render json: @plate_comment.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /plate_comments/1
  # PATCH/PUT /plate_comments/1.json
  def update
    respond_to do |format|
      if @plate_comment.update(plate_comment_params)
        format.html { redirect_to restaurante_plate_plate_comments_path(@restaurante, @plate), notice: 'Comentario actualizado.' }
        format.json { render :show, status: :ok, location: @plate_comment }
      else
        format.html { render :edit }
        format.json { render json: @plate_comment.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /plate_comments/1
  # DELETE /plate_comments/1.json
  def destroy
    @plate_comment.destroy
    respond_to do |format|
      format.html { redirect_to restaurante_plate_plate_comments_path(@restaurante, @plate), notice: 'Comentario eliminado.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_plate_comment
      @plate_comment = PlateComment.find(params[:id])
    end

    def set_restaurante
      @restaurante = Restaurante.find(params[:restaurante_id])
    end
    def set_plate
      @plate = Plate.find(params[:plate_id])
    end
    # Never trust parameters from the scary internet, only allow the white list through.
    def plate_comment_params
      params.require(:plate_comment).permit(:body, :avatar)
    end

    def check_owner
      if !(current_client.id == @plate_comment.client_id)
        redirect_to restaurante_plate_plate_comments_path(@restaurante, @plate)
      end
    end

    def check_destroyer
      if current_client
        if !(current_client.id == @plate_comment.client_id)
          redirect_to restaurante_plate_plate_comments_path(@restaurante, @plate)
        end
      end
      if !(current_client) && !(current_admin)
        redirect_to new_client_session_path
      end
    end
end
