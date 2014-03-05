class ClientsController < ApplicationController
  load_and_authorize_resource
  before_filter :authenticate_user!
  
  
  def index
    @Clients = Client.accessible_by(current_ability)
  end
  
  def new
    @client = Client.new
  end
  
  def show
    @client = Client.find(params[:id])
  end
  
  def create
    @client = Client.new(client_params)
    
    respond_to do |format|
      if @client.save
        format.html { redirect_to clients_url, :success => "Client created successfully!"}
        format.json { render action: 'show', status: :created, location: @client }
      else
        format.html { render action: 'new' }
        format.js   { render action: 'new' }
        format.json { render json: @client.errors, status: :unprocessable_entity }
      end
    end
  end
  
  private
    def admin_check
      if (!current_user.is_admin? || !current_user.is_superuser?)
        render :status => :forbidden
      end
    end
    
    def client_params
      params.require(:client).permit(:name)
    end
end
