class PostsController < ApplicationController
  before_action :set_post, only: %i[edit update destroy]

  def index
    @posts = Post.includes(:user, :likes).order(:created_at)
  end

  def new
    @post = Post.new
  end

  def create
    post = current_user.posts.create!(post_params)
    redirect_to post
  end

  def show
    @post = Post.find(params[:id])
  end

  def edit
  end

  def update
    @post.update!(post_params)
    redirect_to @post
  end

  def destroy
    @post.destroy!
    redirect_to root_path
  end

  private

  def post_params
    params.require(:post).permit(:content)
  end

  def set_post
    # 「自分の投稿」の中から URL の :id に対応する投稿を探す
    # 「他人の投稿」の場合はエラーを出す
    @post = current_user.posts.find(params[:id])
    redirect_to root_path, alert: "権限がありません" if @post.nil?
  end
end
