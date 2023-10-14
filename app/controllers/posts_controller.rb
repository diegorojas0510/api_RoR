class PostsController < ApplicationController
  # manejamos las exepciones que pueden ocurrir donde vamos a recibir en formato json los errores de la pruebas
  # Se debe tener en cuenta el orden de las excepciones.
  rescue_from Exception do |e|
    render json: { errors: e.message }, status: :internal_server_error # representa un 500 servidor fallo
  end

  rescue_from ActiveRecord::RecordInvalid do |e|
    render json: { errors: e.message }, status: :unprocessable_entity
  end
    def index
    # return posts published
    @posts = Post.where(published: true)
    if params[:search].nil? || params[:search].present?
      @posts = PostsSearchService.search(@posts, params[:search])
    end
    # incluimos modelos que esten relacionados con el modelo post y rails puede hacer esto ebn una sola query
    render json: @posts.includes(:user), status: :ok

  end
  # GET /post/{id}
  def show
    @posts = Post.find(params[:id])
    render json: @posts, status: :ok
  end

  # POST /pots
  def create
    @post = Post.create(create_params)
    if @post.valid?
      render json: @post, status: :created
    else
      render json: { error: "No se pudo crear el post" }, status: :unprocessable_entity
    end
  end

  # PUT /posts{:id}
  def update
    @post = Post.find(params[:id])
    if @post.update(update_params)
      render json: @post, status: :ok
    else
      render json: { error: "No se pudo actualizar el post" }, status: :unprocessable_entity
    end
  end


  private

  def create_params
    params.require(:post).permit(:title, :content, :published, :user_id)
  end

  def update_params
    params.require(:post).permit(:title, :content, :published)
  end
end
