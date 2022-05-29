class PostsController < ApplicationController
  before_action :authenticate_user

  def index
    @search_word = params[:keyword]

    if @search_word
      # タイトルもしくは案件概要に検索キーワードが含まれている投稿を詰める
      @posts = Post.where(['content LIKE ?', "%#{@search_word}%"]).or(Post.where(['title LIKE ?', "%#{@search_word}%"]))
    else 
      @posts = Post.all.order(updated_at: :desc)
    end
  end

   # お気に入りした案件の表示
  def favorites_index
    @user = @current_user
    favorites_table = Favorite.all
    @posts = []

    if favorites_table
      favorites_table.each do |favorite|
        if favorite.user_id = @user
          post = Post.find_by(id: favorite.post_id)
          @posts.push(post)
        end
      end
    end
    render("posts/index")
  end

  def show
    @post = Post.find_by(id: params[:post_id])
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
      NumApplicants: params[:NumApplicants],
      start_date: params[:start_date],
      end_date: params[:end_date]
    )

    if @post.save 
      flash[:notice] = "投稿を作成しました"
      redirect_to("/posts/index")
    else
      render("posts/new")
    end
  end

  def edit
    @post = Post.find_by(id: params[:post_id])
  end

  def update
    @post = Post.find_by(id: params[:post_id])
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
    @post = Post.find_by(id: params[:post_id])
    @post.destroy
    flash[:notice] = "投稿を削除しました"
    redirect_to("/posts/index")
  end
  
end
