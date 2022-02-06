class PostsController < ApplicationController
  before_action :authenticate_user

  def index
    @posts = Post.all.order(updated_at: :desc)
  end

  def show
    @post = Post.find_by(id: params[:id])
    #画像は後ほど追加予定(https://prog-8.com/rails5/study/9/4#/11)
    @user = @post.user
  end

  def new
    @post = Post.new
  end

  def create
    @post = Post.new(
      content: params[:content],
      user_id: @current_user.id,
      title: params[:title],
      NumApplicants: params[:NumApplicants] 
    )

    if @post.save 
      flash[:notice] = "投稿を作成しました"
      redirect_to("/posts/index")
    else
      render("posts/new")
    end
  end

  def edit
    @post = Post.find_by(id: params[:id])
  end

  def update
    @post = Post.find_by(id: params[:id])
    @post.title = params[:title]
    @post.content = params[:content]
    @post.NumApplicants = params[:NumApplicants]

    if @post.save 
      flash[:notice] = "投稿を編集しました"
      redirect_to("/posts/index")
    else
      render("posts/edit")
    end
  end

  def destroy
    @post = Post.find_by(id: params[:id])
    @post.destroy
    flash[:notice] = "投稿を削除しました"
    redirect_to("/posts/index")
  end
  
end
