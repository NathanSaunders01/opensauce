class ProfilesController < ApplicationController
  before_action :authenticate_user!
  before_action :only_current_user
  
  before_action :set_current_user, only: [:create, :edit, :update]
  
  # GET to /users/:user_id/profile/new
  def new
    # Render blank profile details form
    @profile = Profile.new
  end
  
  # POST to /users/:user_id/profile
  def create
    # Ensure that we have the user who is filling out form
    
    # Create profile linked to this specific user
    @profile = @user.build_profile( profile_params )
    if @profile.save
      flash[:success] = "Profile created!"
      redirect_to user_path(id: params[:user_id] )
    else 
      render action: :new
    end
  end
  
  def edit
    
    @profile = @user.profile
  end
  
  def update
    
    @profile = @user.profile
    if @profile.update_attributes(profile_params)
      flash[:success] = "Profile updated!"
      redirect_to user_path(id: params[:user_id] )
    else
      render action: :edit
    end
  end
  
private 
  def profile_params
    params.require(:profile).permit(:first_name, :last_name, :avatar, :skills, :description)
  end
  
  def only_current_user
    @user = User.find( params[:user_id] )
    redirect_to(root_url) unless @user == current_user
  end
  
  def set_current_user
    @user = User.find( params[:user_id] )
  end
end
