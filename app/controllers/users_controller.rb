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
      session[:name] = @user.name
      session[:user_id] = @user.id
      flash[:notice] = "ログインしました"
      redirect_to("/")
    else
      render("users/login_form")
    end
  end

  def logout
    session[:name] = nil
    session[:user_id] = nil
    flash[:notice] = "ログアウトしました"
    redirect_to("/users/login_form")
  end

  def show
    @user = User.find_by(id: params[:id])
  end
end
