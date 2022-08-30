class AmessagesController < ApplicationController

    def create
        @post = Post.find_by(id: params[:to_user_id])
        @amessage = Amessage.new(
            message_content: params[:message_content],
            from_user_id: @current_user.id,
            to_user_id: @post.user_id
        )
        @amessage.save
        redirect_to("/posts/index")
    end

    def index
        @messages = Amessage.all
    end

  end
  