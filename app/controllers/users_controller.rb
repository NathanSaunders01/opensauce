class UsersController < ApplicationController
  before_action :authenticate_user!
  
  def show
    @user = User.find( params[:id])
    @user_projects = @user.projects.paginate(page: params[:page], per_page: 3)
  end
  
  def index
    @users = User.includes(:profile).paginate(page: params[:page], per_page: 5)
  end
  
  def friends
    
  end
  

  def approve
    @user = User.find( params[:id])
    if @user.update(admin: true)
      flash[:success] = "User has been upgraded to Admin status"
      redirect_to user_path(@user)
    else
      flash[:danger] = "Unable to upgrade user to Admin status"
      redirect_to root_path
    end
  end
  
  def remove
    @user = User.find( params[:id])
    if @user.update(admin: false)
      flash[:success] = "User no longer has Admin status"
      redirect_to user_path(@user)
    else
      flash[:danger] = "Unable to remove Admin status"
      redirect_to root_path
    end
  end
end