class UsersController < ApplicationController
  def new
    @user = User.new
  end
  
  def create
    @user = User.new(user_params)
    
    if @user.save
      login_user!(@user)
      redirect_to user_url(@user)
    else
      flash.now[:error] = @user.errors.full_messages
      render :new
    end
  end
  
  def show
    @user = User.find(params[:id])
    @goals = @user.goals.order(:deadline)
    @public_goals = @user.goals.where(private: true)
    @goal = Goal.new
  end
  
  private
  
  def user_params
    params.require(:user).permit(:username, :password)
  end
end
