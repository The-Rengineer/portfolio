class UsersController < ApplicationController

  # loginメソッド(postメソッドに対しはbefore_actionが効いていない)
  before_action :forbid_login_user, only: ["login_form", "login"]
  
  #CSRF保護の無効化、あとで要確認
  # protect_from_forgery with: :null_session

  # def top <= 必要か確認する
  # end

  def new
  end

  def create
    @user = User.new(name: params[:name], email: params[:email], password: params[:password])
    
    if authenticatePassword
      @user.save
    end
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
      redirect_to("/posts/index")
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

  
  
  def authenticatePassword
    if @user.password == params[:confirmPassword]
      return true
    end
  end


end
