class SessionsController < ApplicationController
  # ☓ @session = Session.new
  # ○ scope: : session + url session_new_path
  # Get/login
  def new
  end
  # Post/login
  def create
    user = User.find_by(email: params[:session][:email].downcase)
    if user && user.authenticate(params[:session][:password])
      session[:user_id] = user.id
      redirect_to user_path(user.id)
    else
      flash.now[:danger] = 'ログインに失敗しました。'
    render 'new'
    # redirect_to vs render 
    # GET /users/1 => show template
    #                 render 'new' (0)回のリクエスト
    end
  end

  def destroy
    session.delete(:user_id)
    flash[:notice] = 'ログアウトしました'
    redirect_to new_session_path
  end

end
