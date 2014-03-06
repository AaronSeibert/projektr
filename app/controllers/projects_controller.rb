class ProjectsController < ApplicationController
  load_and_authorize_resource :find_by => :slug
  before_filter :authenticate_user!, :except => [:show]
  
  
  def index
    @Projects = Project.accessible_by(current_ability)
  end
  
  def new
    @project = Project.new
  end
  
  def show
    @project = Project.friendly.find(params[:id])
  end
  
  def create
    @project = Project.new(project_params)
    @project.tenant_id = current_user.tenant_id
    
    if @project.save
      redirect_to project_url(@project.slug), notice: 'Project was successfully created.'
    else
      render 'new'
    end
  end
  
  # PATCH/PUT /revisions/1
  def update
    if @project.update(project_params)
      redirect_to project_url(@project.slug), notice: 'Project was successfully updated.'
    else
      render action: 'edit'
    end
  end
  
  private
    def project_params
      params.require(:project).permit(:name, :client_id, :active, :user_ids => [])
    end
end
