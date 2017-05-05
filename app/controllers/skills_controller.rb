class SkillsController < ApplicationController
  
before_action :require_admin, except: [:index, :show]

  def index
    @skills = Skill.paginate(page: params[:page], per_page: 5)
  end
  
  def new
    @skill = Skill.new
  end
  
  def create
  @skill = Skill.new(skills_params)
  if @skill.save
    flash[:success] = "Skills was created successfully"
    redirect_to skills_path
  else
    render 'new'
  end
  end
  
  def show
    @skill = Skill.find( params[:id] )
    @skill_profiles = @skill.profiles.paginate(page: params[:page], per_page: 5)
  end
  
  private
  
  def skills_params
    params.require(:skill).permit(:name)
  end
  
  def require_admin
    if !user_signed_in? || (user_signed_in? and !current_user.admin?)
    flash[:danger] = "Only admins can perform that action"
    redirect_to skills_path
    end
  end

end