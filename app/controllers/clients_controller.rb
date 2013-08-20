class ClientsController < ApplicationController
  
  before_filter :authenticate_user!
  
  def index
    @Clients = Client.all
  end
  
  def new
    @client = Client.new
  end
  
  def show
    @client = Client.find(params[:id])
  end
  
  def create
    @client = Client.new(client_params)
    
    if @client.save
      redirect_to @client
    else
      render 'new'
    end
  end
  
  private
    def client_params
      params.require(:client).permit(:name)
    end
end
