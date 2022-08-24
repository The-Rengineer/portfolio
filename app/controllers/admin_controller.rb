class AdminController < ApplicationController
  def index
    @users = User.all.order(updated_at: :desc)
  end

  def destroy
    @user = User.find_by(id: params[:user_id])
    @user.destroy
    flash[:notice] = "ユーザを削除しました"
    redirect_to("/admin/index")
  end
end
