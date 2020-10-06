class UsersController < ApplicationController
  #GET /users/new
  def new
    @user = User.new
  end

  # POST /users (+ params)
  def create 
    # user + (given params).save
    # User.create(params[:user][:admin]) 想定していないparamsが混じってしまう可能性もあり
    @user = User.new(user_params) 
    if @user.save
    else
      render 'new'
    end
  end

  def show
    @user = User.find(params[:id])
  end

    private

    def user_params
      params.require(:user).permit(:name, :email, :password,
        :password_confirmation)
    end
end
