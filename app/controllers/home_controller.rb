class HomeController < ApplicationController
  def top
    @users = User.where.not(id: session[:user_id])
  end
end
