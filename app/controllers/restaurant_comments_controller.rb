class RestaurantCommentsController < ApplicationController
  before_action :set_restaurante, only: %i[like dislike index show new create edit update destroy]
  before_action :set_restaurant_comment, only: [:like, :dislike, :show, :edit, :update, :destroy]
  before_action :authenticate_client!, only: [:new, :edit, :create, :update]
  before_action :check_owner, only: [:edit, :update]
  before_action :check_destroyer, only: [:destroy]

  # GET /restaurant_comments
  # GET /restaurant_comments.json
  def index
    @restaurant_comments = @restaurante.restaurant_comments
  end

  # GET /restaurant_comments/1
  # GET /restaurant_comments/1.json
  def show
  end

  def like
    @restaurant_comment.clients_like << current_client.id.to_s
    @restaurant_comment.save()
    redirect_to restaurante_restaurant_comments_path(@restaurante)
  end

  def dislike
    @restaurant_comment.clients_like.delete(current_client.id.to_s)
    @restaurant_comment.save()
    redirect_to restaurante_restaurant_comments_path(@restaurante)

  end

  # GET /restaurant_comments/new
  def new
    @restaurant_comment = RestaurantComment.new
  end

  # GET /restaurant_comments/1/edit
  def edit
  end

  # POST /restaurant_comments
  # POST /restaurant_comments.json
  def create
    @restaurant_comment = @restaurante.restaurant_comments.create(restaurant_comment_params)
    @restaurant_comment.client_id = current_client.id
    @restaurant_comment.client_name = current_client.username
    @restaurant_comment.clients_like ||= []

    respond_to do |format|
      if @restaurant_comment.save
        format.html { redirect_to restaurante_restaurant_comments_path(@restaurante), notice: 'Comentario creado exitosamente.' }
        format.json { render :show, status: :created, location: @restaurant_comment }
      else
        format.html { render :new }
        format.json { render json: @restaurant_comment.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /restaurant_comments/1
  # PATCH/PUT /restaurant_comments/1.json
  def update
    respond_to do |format|
      if @restaurant_comment.update(restaurant_comment_params)
        format.html { redirect_to restaurante_restaurant_comments_path(@restaurante), notice: 'Comentario actualizado.' }
        format.json { render :show, status: :ok, location: @restaurant_comment }
      else
        format.html { render :edit }
        format.json { render json: @restaurant_comment.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /restaurant_comments/1
  # DELETE /restaurant_comments/1.json
  def destroy
    @restaurant_comment.destroy
    respond_to do |format|
      format.html { redirect_to restaurante_restaurant_comments_path(@restaurante), notice: 'Comentario eliminado.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_restaurant_comment
      @restaurant_comment = RestaurantComment.find(params[:id])
    end

    def set_restaurante
      @restaurante = Restaurante.find(params[:restaurante_id])
    end
    # Never trust parameters from the scary internet, only allow the white list through.
    def restaurant_comment_params
      params.require(:restaurant_comment).permit(:body , :avatar)
    end
    def check_owner
      if !(current_client.id == @restaurant_comment.client_id)
        redirect_to restaurante_restaurant_comments_path(@restaurante)
      end
    end

    def check_destroyer
      if current_client
        if !(current_client.id == @restaurant_comment.client_id)
          redirect_to restaurante_restaurant_comments_path(@restaurante)
        end
      end
      if !(current_client) && !(current_admin)
        redirect_to new_client_session_path
      end
    end
end
