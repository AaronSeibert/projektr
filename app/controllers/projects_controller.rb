class ProjectsController < ApplicationController
  
  before_filter :authenticate_user!, :except => [:show]
  
  def index
    @Projects = Project.all
  end
  
  def new
    @project = Project.new
  end
  
  def show
    @project = Project.friendly.find(params[:id])
  end
  
  def create
    @project = Project.new(project_params)
    
    if @project.save
      redirect_to @project
    else
      render 'new'
    end
  end
  
  private
    def project_params
      params.require(:project).permit(:name, :client_id, :active)
    end
end
