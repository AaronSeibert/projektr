class UsersController < ApplicationController
  load_and_authorize_resource
  before_filter :authenticate_user!
  
  def index
    @users = User.accessible_by(current_ability)
  end

  def show
    @user = User.find(params[:id])
  end

  def new
    @user = User.new
  end

  def edit
    @user = User.find(params[:id])
  end

  def create
    @user = User.new(user_params)
    respond_to do |format|
      if @user.save
        format.html { redirect_to users_url, :success => "User created successfully!"}
        format.json { render action: 'show', status: :created, location: @user }
      else
        format.html { render action: 'new' }
        format.js   { render action: 'new' }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    if params[:user][:password].blank?
      params[:user].delete("password")
      params[:user].delete("password_confirmation")
    end
    
    @user = User.find(params[:id])
    respond_to do |format|
      if @user.update(user_params)
        if current_user.id == @user.id
	  sign_in(@user, :bypass => true)
	end
        format.html { redirect_to users_url, :success => "User has been updated" }
      else
        format.html { render action: 'edit' }
        format.js   { render action: 'edit' }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @user = User.find(params[:id])
    @user.destroy
    redirect_to users_path, notice: 'User was successfully deleted.'
  end
  
  private
  
    # Use callbacks to share common setup or constraints between actions.
    def set_revision
      @revision = Revision.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def user_params
      params.require(:user).permit(:email, :password, :password_confirmation, :admin, :superuser, :tenant_id, :client_id, :first_name, :last_name)
    end
end
