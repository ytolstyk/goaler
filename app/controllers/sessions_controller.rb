class SessionsController < ApplicationController
  def new
  end
  
  def create
    @user = User.find_by_credentials(
      params[:user][:username],
      params[:user][:password]
    )
    
    if @user
      login_user!(@user)
      redirect_to user_url(@user)
    else
      flash.now[:error] = ["Invalid username or password."]
      render :new
    end
  end
  
  def destroy
    logout_user!(current_user)
    redirect_to new_session_url
  end
end
