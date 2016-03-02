class ServiceProvidersController < ApplicationController
before_action :authenticate_ops_user!
def index
    @service_providers = ServiceProvider.all
   # @service_requests = ServiceRequest.all
    #total = @service_providers.count
    #render json: {
    #           status: 'success',
    #           total: total,
    #           count: @service_providers.count,
     #          data: @service_providers,
      #     }, status: 200
  end

 # api :GET, '/service_providers/:id'
 # description 'Get service provider with id = {:id}'  
  def show
           @service_providers = ServiceProvider.find(params[:id])
           @linkreq= @service_providers.service_requests
           #@service_requests = ServiceRequest.where(user_id: params[:user_id])
  end

  def new
   @service_provider = ServiceProvider.new
   
  end

 # api :POST, '/service_providers'
 # description 'Create new service_provider'
  def create
    @service_provider = ServiceProvider.new(service_provider_params)
   # @service = Service.new(service_params)
    if @service_provider.save
      redirect_to service_providers_path
      flash[:info] = "Service provider is added."
    else
      render 'new'
    end
  end

  #api :PUT, '/service_providers/:id'
  #description 'Update service_provider with id = {:id}'
  def edit
    @service_provider = ServiceProvider.find(params[:id])
  end

  def update
    @service_provider = ServiceProvider.find(params[:id])

    if @service_provider.update_attributes(service_provider_params)
      flash[:success] = "Profile updated"
      redirect_to @service_provider
    else
     render 'edit'
    end
  end

  #def update
    #if @service_provider.update(service_params)
  def allrequests

    @service_requests = ServiceRequest.all

  end
    
     
  

  #api :DELETE, '/service_providers/:id'
  #description 'Delete service_provider with id = {:id}'
#  def destroy
  #  @service_provider.destroy
  #  render json: {
    #          status: 'success',
     #      }, status: 204
 # end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_service_provider
      @service_provider = ServiceProvider.find(params[:id])
    rescue
      render json: {
                 status: 'error',
                 message: ["Service Provider with id = #{params[:id]}, doesn't exist"],
             }, status: 404
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def service_provider_params
      params.require(:service_provider).permit(:id, :status, :name, :description, :contactno ,:address)
    end

  end

  