class UsersController < ApplicationController
  
  before_filter :authenticate_user!
  before_filter :su_check, :only => [:create, :update]
  before_filter :admin_check, :except => [:show, :edit, :update]
  
  def index
    if current_user.is_superuser?
      @users = User.all
    else
      @users = current_user.tenant.users
    end
  end

  def show
    if current_user.is_superuser?
      @user = User.find(params[:id])
    elsif current_user.is_admin? && User.find(params[:id].tenant == current_user.tenant)
      @user = User.find(params[:id])
    elsif User.find(params[:id]) != current_user
      redirect_to current_user
    else
      @user = User.find(params[:id])
    end
  end

  def new
    @user = User.new
  end

  def edit
    if current_user.is_superuser? || (current_user.is_admin? && User.find(params[:id].tenant == current_user.tenant))
      @user = User.find(params[:id])
    elsif User.find(params[:id]) != current_user
      redirect_to edit_user_path(current_user)
    else
      @user = User.find(params[:id])
    end
  end

  def create
    @user = User.new(user_params)

    if @user.save
      UserMailer.welcome_email(@user).deliver
      redirect_to @user, notice: 'User was successfully created.'
    else
      render :action => 'new'
    end
  end

  def update
    if params[:user][:password].blank?
      params[:user].delete("password")
      params[:user].delete("password_confirmation")
    end
    
    @user = User.find(params[:id])

    if @user.update_attributes(user_params)
      sign_in(@user, :bypass => true) if @user == current_user
      redirect_to @user, notice: 'User was successfully updated.'
    else
      render :action => 'edit'
    end
  end

  def destroy
    @user = User.find(params[:id])
    @user.destroy
    redirect_to users_path, notice: 'User was successfully deleted.'
  end
  
  private
    def su_check
      logger.debug "checking su"
      logger.debug params
      @user = params[:user]
      if (params[:user].has_key?(:superuser) && !current_user.is_superuser?)
        render :status => :forbidden
      end
    end
    
    def admin_check
      if (!current_user.is_admin? || !current_user.is_superuser?)
        render :status => :forbidden
      end
    end
  
    # Use callbacks to share common setup or constraints between actions.
    def set_revision
      @revision = Revision.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def user_params
      params.require(:user).permit(:email, :password, :admin, :superuser, :tenant_id)
    end
end
