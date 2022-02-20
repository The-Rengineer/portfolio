class LikesController < ApplicationController
    before_action :authenticate_user
    
    def create
        @like = Like.new(user_id: @current_user.id, post_id: params[:post_id])
        @like.save
        redirect_to("/posts/#{params[:post_id]}")
    end

    def destroy
        @like = Like.find_by(
            user_id: @current_user.id,
            post_id: params[:post_id]
        )
        @like.destroy
        redirect_to("/posts/#{params[:post_id]}")
    end


    # ログインしたユーザーがいいねした投稿のみを表示させる
    def index
        # @current_user = 1 => 取得できるデータ数 = 3件 取得できている
        @user = User.find_by(id: @current_user)
        @likes = Like.where(user_id: @current_user)
        @likes_count = Like.where(user_id: @current_user).count

    end
    
  end