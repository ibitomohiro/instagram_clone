class UsersController < ApplicationController
  before_action :logged_in_user, only: [:edit, :update]
  #GET /users/new
  def new
    @user = User.new
  end

  # POST /users (+ params)
  def create 
    # user + (given params).save
    # User.create(params[:user][:admin]) 想定していないparamsが混じってしまう可能性もあり
    # stong params で対策
    @user = User.new(user_params) 
    if @user.save
      flash[:success] = "Welcome to Instagram clone!"
      redirect_to @user
      # redirect to user_path(@user)
      # redirect_to user_path(@user.id)
          #             => /users/1
    else
      render 'new'
    end
  end

  def show
    @user = User.find(params[:id])
  end

  def edit 
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    if @user.update(user_params)
      flash[:success] = "プロフィールを更新しました！"
      redirect_to @user
    else
      render 'edit'
    end
  end

    private

    def user_params
      params.require(:user).permit(:name, :email, :image, :password,
        :password_confirmation)
    end

    def logged_in_user
      unless logged_in?
        flash[:danger] = "Please log in"
        redirect_to new_session_url
      end
    end
end
