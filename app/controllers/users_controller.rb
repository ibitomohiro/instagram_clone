class UsersController < ApplicationController
  #GET /users/new
  def new
    @user = User.new
  end

  
  def create 
    # user + (given params).save
  end

  def show
    @user = User.find(params[:id])
  end
  
end
