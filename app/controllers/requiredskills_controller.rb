class RequiredskillsController < ApplicationController
  
  def new
    @requiredskill = Requiredskill.new
  end
  
  def create
  @requiredskill = Requiredskill.new(required_skill_params)

  respond_to do |format|
    if @requiredskill.save
      format.html { redirect_to @requiredskill, notice: 'Required skill was successfully created.' }
      format.json { render :show, status: :created, location: @requiredskill }
    else
      format.html { render :new }
      format.json { render json: @requiredskill.errors, status: :unprocessable_entity }
    end
  end
  end
  
  def edit
  end
  
  def index
  end

private 
  def required_skill_params
    params.require(:requiredskill).permit(:name)
  end

end