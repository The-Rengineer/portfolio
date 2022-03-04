class ProfilesController < ApplicationController
  
  def new
    @user = User.find_by(id: params[:user_id])
    @profile = Profile.find_by(userId: params[:user_id])
  end

  def edit
    @user = User.find_by(id: params[:user_id])
    if @profile = Profile.find_by(userId: params[:user_id])
    
    else
      @profile = nil
    end
  end

  def create
    @profile = Profile.new(age: params[:age], birthPlace: params[:birthPlace], skill: params[:skill], userId: session[:user_id])
    
    if @profile.save
      redirect_to("/profiles/#{session[:user_id]}")
    end
  end

  def update
    @profile = Profile.find_by(userId: session[:user_id])
    @profile.update(age: params[:age], birthPlace: params[:birthPlace], skill: params[:skill])
    redirect_to("/profiles/#{session[:user_id]}")
  end
end
