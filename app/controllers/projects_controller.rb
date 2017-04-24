class ProjectsController < ApplicationController
  def new
    @project = Project.new
  end
  
  def create
    @user = User.find( params[:user_id] )
    @project = @user.projects.build( project_params )
    if @project.save
      flash[:success] = "Project saved!"
      redirect_to user_path(id: current_user.id )
    else
      render action: :new
    end
  end
  
  def show
    @user = User.find(params[:user_id])
    @project = @user.projects.find_by_id(params[:id])
  end
  
  def index
  end
  
  def edit
  end
  
  
private
  def project_params
    params.require(:project).permit(:title, :plan, requiredskill_ids[], :category)
  end
end