class UsersController < ApplicationController
  #CSRF保護の無効化、あとで要確認
  protect_from_forgery with: :null_session
  def top
  end

  def new
  end

  def create
    @user = User.new(name: params[:name], email: params[:email], password: params[:password])
    @user.save
    redirect_to("/")
  end

  def login_form
  end

  def login
    @user = User.find_by(email: params[:email], password: params[:password])
    if @user
      flash[:notice] = "ログインしました"
      redirect_to("/")
    else
      render("users/login")
    end
  end
end
