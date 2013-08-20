class ScreenshotsController < ApplicationController
  before_action :set_screenshot, only: [:show, :edit, :update, :destroy]
  before_filter :authenticate_user!, :except => [:show]

  # GET /screenshots
  def index
    @screenshots = Screenshot.all
  end

  # GET /screenshots/1
  def show
  end

  # GET /screenshots/new
  def new
    @screenshot = Screenshot.new
  end

  # GET /screenshots/1/edit
  def edit
  end

  # POST /screenshots
  def create
    @screenshot = Screenshot.new(screenshot_params)

    if @screenshot.save
      redirect_to @screenshot.revision.project, notice: 'Screenshot was successfully added.'
    else
      render action: 'new'
    end
  end

  # PATCH/PUT /screenshots/1
  def update
    if @screenshot.update(screenshot_params)
      redirect_to @screenshot.revision.project, notice: 'Screenshot was successfully updated.'
    else
      render action: 'edit'
    end
  end

  # DELETE /screenshots/1
  def destroy
    @project = @screenshot.revision.project
    @screenshot.destroy
    redirect_to @project, notice: 'Screenshot was successfully deleted.'
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_screenshot
      @screenshot = Screenshot.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def screenshot_params
      params.require(:screenshot).permit(:name, :image, :revision_id)
    end
end
