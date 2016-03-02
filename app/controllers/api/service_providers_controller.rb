class Api::ServiceProvidersController < ApplicationController

  #before_action :set_service_provider, only: [:show, :edit, :update, :destroy, :get_services, :add_services]
  # before_action :authenticate_user!

  def index
    @service_providers = ServiceProvider.all
    total = @service_providers.count
    render json: {
               status: 'success',
               total: total,
               count: @service_providers.count,
               data: @service_providers,
           }, status: 200
  end

 # api :GET, '/service_providers/:id'
 # description 'Get service provider with id = {:id}'  
  def show
           @service_providers = ServiceProvider.find(params[:id])
    render json: {
               status: 'success',
               data: @service_provider,
           }, status: 200
  end

 # api :POST, '/service_providers'
 # description 'Create new service_provider'
  def create
    @service_provider = ServiceProvider.new(service_provider_params)
   # @service = Service.new(service_params)
    if @service_provider.save
      render json: {
                 status: 'success',
                 data: @service_provider
             }, status: 201
    else
      render json: {
                 status: 'error',
                 errors: ["Missing `confirm_success_url` param."],
                 message: [:unprocessable_entity],
             }, status: 400
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
       render json: {
                 status: 'success',
                 data: @service_provider
             }, status: 200

    else
      render json: {
                 status: 'error',
                 message: [:unprocessable_entity],
             }, status:400
    end
  end

  #def update
    #if @service_provider.update(service_params)
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