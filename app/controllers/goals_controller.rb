class GoalsController < ApplicationController
  def show
    @goal = Goal.find(params[:id])
  end
  
  def create
    @goal = Goal.new(goal_params)
    @goal.user = current_user
    
    if @goal.save
      flash[:error] = ["Added goal"]
      redirect_to user_url(current_user)
    else
      @user = current_user
      @goals = @user.goals
      flash.now[:error] = @goal.errors.full_messages
      render "users/show"
    end
  end
  
  def edit
    @goal = Goal.find(params[:id])
  end
  
  def update
    @goal = Goal.find(params[:id])
    
    if @goal.update_attributes(goal_params)
      flash[:error] = ["Goal updated!"]
      redirect_to goal_url(@goal)
    else
      flash.now[:error] = @goal.errors.full_messages
      render :edit
    end
  end
  
  def destroy
    @goal = Goal.find(params[:id])
    @goal.delete
    redirect_to user_url(current_user)
  end
  
  private
  
  def goal_params
    params.require(:goal).permit(:title, :body, :deadline, :private)
  end
end
