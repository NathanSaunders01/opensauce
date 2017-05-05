class ProjectsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_project, only: [:edit, :update, :show, :destroy]
  before_action :require_same_user, only: [:edit, :update, :destroy]
  
  def new
    @project = Project.new
  end
  
  def create
    @project = Project.new(project_params)
    @project.user = current_user
    if @project.save
      flash[:success] = "Project saved!"
      redirect_to project_path(@project)
    else
      render 'new'
    end
  end
  
  def edit
  end
  
  def update
    if @project.update(project_params)
      flash[:success] = "Project was successfully updated"
      redirect_to project_path(@project)
    else
      render 'edit'
    end
  end
  
  def show
  end
  
  def index
    @projects = Project.paginate(page: params[:page], per_page: 5)
  end
  
  def destroy
    @project.destroy
    flash[:danger] = "Project was successfully deleted"
    redirect_to projects_path
  end
  
  
private
  def project_params
    params.require(:project).permit(:title, :plan, category_ids: [])
  end
  
  def set_project
     @project = Project.find(params[:id])
  end
  
  def require_same_user
    if current_user != @project.user and !current_user.admin?
      flash[:danger] = "You can only edit or delete your own articles"
      redirect_to root_path
    end
  end
end