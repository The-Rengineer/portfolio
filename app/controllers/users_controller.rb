class UsersController < ApplicationController
  def top
  end

  def new
  end

  def create
    @user = User.new(name: params[:name], email: params[:email], password: params[:password])
    @user.save
    redirect_to("/users/top")
  end
end
