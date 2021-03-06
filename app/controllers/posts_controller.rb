class PostsController < ApplicationController
  #devise_token_auth_group :member, contains: [:user, :admin]
  before_action :authenticate_user!, only: [:create, :update, :destroy]
  before_action :set_post, only: [:show, :update, :destroy]

  # GET /posts
  # GET /posts.json
  def index
    @posts = Post.all
  end

  # GET /posts/1
  # GET /posts/1.json
  def show
  end

  # POST /posts
  # POST /posts.json
  def create
    #@post = Post.new(post_params)
    @post = current_user.posts.build(post_params)

    if @post.save
      render :show, status: :created, location: @post
    else
      render json: @post.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /posts/1
  # PATCH/PUT /posts/1.json
  def update
    if @post.user == current_user || admin_signed_in?
      if @post.update(post_params)
        render :show, status: :ok, location: @post
      else
        render json: @post.errors, status: :unprocessable_entity
      end
    else
      render json: @post.errors, status: :unauthorized
    end
  end

  # DELETE /posts/1
  # DELETE /posts/1.json
  def destroy
    if @post.user == current_user || admin_signed_in?
      @post.destroy
    else
      render json: @post.errors, status: :unauthorized
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_post
      @post = Post.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def post_params
      params.require(:post).permit(:title, :body)
    end
end
