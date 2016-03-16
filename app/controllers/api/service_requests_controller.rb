class Api::ServiceRequestsController < ApplicationController

  #before_filter :authorize , only: [:edit, :update]
 # before_action :check_access #:except => [:index]

	def index
    @request = ServiceRequest.all
    total = @request.count
    render json: {
               status: 'success',
               requests: @request,
           }, status: 200
     end


     def upcoming
       @current_date=DateTime.now.to_date
       t= Time.now.strftime("%H:%M")
       puts @current_date
       @userid=params[:user_id]      
       @request = ServiceRequest.where("user_id=? and (status=? or status=?) and date>=? " , 
       @userid,"Pending" , "Processed",@current_date).
       order('service_requests.date ASC').order('service_requests.request_time ASC')
       @request=@request.sort_by {|service_request| [service_request.date , service_request.request_time] } 
      render json: {
               status: 'success',
               requests: @request,
           }, status: 200
     end

       def all
               t= Time.now.strftime("%H:%M")
                 @userid=params[:user_id]
         @request = ServiceRequest.where("user_id=? and (status=? or status=? ) " , @userid,"Completed" ,"Cancelled").order('service_requests.date DESC').order('service_requests.request_time DESC')
         
        render json: {
                 status: 'success',
                 requests: @request,
             }, status: 200
     end

 def user_last_completed
               
                 @userid=params[:user_id]
         @request = ServiceRequest.where("user_id=? and (status=? or status=? ) " , @userid,"Completed" ,"Cancelled").order('service_requests.date DESC').order('service_requests.request_time DESC').limit(1) 
         
        render json: {
                 status: 'success',
                 requests: @request,
             }, status: 200
     end

    def show
           @service_requests = ServiceRequest.where(user_id: params[:user_id])
    render json: {
               status: 'success',
               data: @service_requests
               #user_id: user_id
           }, status: 200
    end 

    def select_request
           @service_requests = ServiceRequest.where(user_id: params[:user_id])
    render json: {
               status: 'success',
               data: @service_requests,
               #user_id: user_id
           }, status: 200
    end 

  def create
    @service_requests = ServiceRequest.new(service_requests_params)
   #  @service_requests.request_time= Time.now.strftime("%H:%M")
      @service_requests.status = "Pending"
      @service_requests.date= DateTime.now.to_date
      @message = "New Request - " + params[:service_request][:address] + " at " + 
      params[:service_request][:request_time]
      @service_requests.date= DateTime.now.to_date
      @user_id= @service_requests.user_id
      @contactno = User.where(:id => @user_id).limit(1).pluck(:contact_no)
      puts @contactno
    if @service_requests.save

      render json: {
                 status: 'success',
                 data: @service_requests
             }, status: 201
    else
      render json: {
                 status: 'error',
                 errors: ["Missing `confirm_success_url` param."],
                 message: [:unprocessable_entity],
             }, status: 400
    end
  end

    def create_upcoming
   @service_requests = ServiceRequest.new(service_requests_params)     
      @service_requests.status = "Pending"
      @date1=params[:service_request][:date]
      @upcoming_date=(@date1.to_date).strftime("%Y-%m-%d")
      @service_requests.date= @upcoming_date
      @user_id= @service_requests.user_id      
      @message = "New Request - " + params[:service_request][:address] + " at " + 
      params[:service_request][:request_time]
      @contactno = User.where(:id => @user_id).limit(1).pluck(:contact_no)
    if @service_requests.save
      render json: {
                 status: 'success',
                 data: @service_requests
             }, status: 201
    else
      render json: {
                 status: 'error',
                 errors: ["Missing `confirm_success_url` param."],
                 message: [:unprocessable_entity],
             }, status: 400
    end
  end



  def edit
    @service_requests = ServiceRequest.find(params[:id])
  end

  def update
    @service_requests = ServiceRequest.find(params[:id])
    if @service_requests.update_attributes(service_requests_params)
       render json: {
                 status: 'success',
                 data: @service_requests
             }, status: 201
    else
      render json: {
                 status: 'error',
                 message: [:unprocessable_entity],
             }, status:400
    end
  end
  def feedback_check
    
  end
  def update_party
    @service_requests = ServiceRequest.find(params[:id])
    @service_requests.party_order_flag = params[:party_order_flag]
    if @service_requests.save
       render json: {
                 status: 'success',
                 data: @service_requests
             }, status: 201
    else
      render json: {
                 status: 'error',
                 message: [:unprocessable_entity],
             }, status:400
    end
  end

  
    # Use callbacks to share common setup or constraints between actions.
    def confirm
      @service_requests = ServiceRequest.find(params[:id])
    if @service_requests.update_attributes(service_requests_params)
       render json: {
                 status: 'success',
                 data: @service_requests
             }, status: 200

    else
      render json: {
                 status: 'error',
                 message: [:unprocessable_entity],
             }, status:400
    end
    end
  


    def cancel
      @service_requests = ServiceRequest.find(params[:service_request][:id])
    if @service_requests.update_attributes(service_requests_params)
       render json: {
                 status: 'success'
             }, status: 200

    else
      render json: {
                 status: 'error',
                 message: [:unprocessable_entity],
             }, status:400
    end
   
    end
    private
    # Never trust parameters from the scary internet, only allow the white list through.
    def service_requests_params
      params.require(:service_request).permit(:id, :user_id, :address, :status, :request_time,
       :promised_time,:service_provider , :daytype , :date , :preference, :party_order_flag, :groceries_flag)
    end
       


       

  private
  def check_access
   @check=ApiKey.where(user_id: params[:user_id], access_token: params[:token]).first
   if @check.nil?
         render json: {
         status: 'error',
         message: [:unauthorized_access],
             }, status:400
    end
    end

end
