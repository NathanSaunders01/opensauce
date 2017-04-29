class UsersController < ApplicationController
  before_action :authenticate_user!
  
  def show
    @user = User.find( params[:id])
    @user_projects = @user.projects.paginate(page: params[:page], per_page: 3)
  end
  
  def index
    @users = User.includes(:profile).paginate(page: params[:page], per_page: 5)
  end

end