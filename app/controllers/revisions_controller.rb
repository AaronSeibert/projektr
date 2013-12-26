class RevisionsController < ApplicationController
  before_action :set_revision, only: [:show, :edit, :update, :destroy]
  before_filter :authenticate_user!, :except => [:show]

  # GET /revisions
  def index
    @revisions = Revision.all
  end

  # GET /revisions/1
  def show
  end

  # GET /revisions/new
  def new
    @revision = Revision.new
    @project = Project.find(params[:project_id])
  end

  # GET /revisions/1/edit
  def edit
    @project = Project.friendly.find(params[:project_id])
  end

  # POST /revisions
  def create
    @revision = Revision.new(revision_params)

    if @revision.save
      redirect_to @revision.project, notice: 'Revision was successfully created.'
    else
      render action: 'new'
    end
  end

  # PATCH/PUT /revisions/1
  def update
    if @revision.update(revision_params)
      redirect_to @revision.project, notice: 'Revision was successfully updated.'
    else
      render action: 'edit'
    end
  end

  # DELETE /revisions/1
  def destroy
    @project = @revision.project
    @revision.destroy
    redirect_to project_url(@project), notice: 'Revision was successfully removed.'
  end
  
  def sendemail
    @revision = Revision.find(params[:id])
    ProjectMailer.delay(:queue => 'email').new_revision_email(@revision)
    redirect_to project_url(@revision.project), notice: 'Email has been queued.'
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_revision
      @revision = Revision.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def revision_params
      params.require(:revision).permit(:name, :project_id)
    end
end
