class UsersController < ApplicationController
  def new
    @user = User.new()
  end

  def create
    @user = User.find_by(:name => params[:user][:name])
    unless @user.present?
      @user = User.new(:name => params[:user][:name])
      @user.save
    end
    flash[:notice] = "welcome to event dashboard"
    session[:id] = @user.id
  end

  # def show
  #   @user = User.find(params[:id])
  # end

  def destroy
    session[:id] = nil 
    flash[:notice] = "Signed out successfully"
    redirect_to root_url
  end
end
