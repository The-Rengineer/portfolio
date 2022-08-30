class UsersController < ApplicationController

  before_action :forbid_login_user, only: ["login_form", "login"]
  
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
    if @user && @user.activation_flag
      session[:name] = @user.name
      session[:user_id] = @user.id
      flash[:notice] = "ログインしました"
      redirect_to("/posts/index")
    else
      flash[:notice] = "メールアドレスまたはパスワードが正しくありません"
      render("users/login_form")      
    end
  end

  def logout
    session[:name] = nil
    session[:user_id] = nil
    flash[:notice] = "ログアウトしました"
    redirect_to("/users/login_form")
  end

  # 削除機能
  def destroy
    @user = User.find_by(id: params[:user_id])
    @user.destroy
    session[:name] = nil
    session[:user_id] = nil
    flash[:notice] = "ユーザを削除しました"
    redirect_to("/users/login_form")
  end

  
  
  def authenticatePassword
    if @user.password == params[:confirmPassword]
      return true
    end
  end


end
