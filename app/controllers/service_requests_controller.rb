
class ServiceRequestsController < ApplicationController

before_action :authenticate_ops_user!
def index
  @service_processed=ServiceRequest.where(status: "Processed")
    @service_requests=ServiceRequest.where(status: "Pending")
    @service_cancelled=ServiceRequest.where(status: "Cancelled")
respond_to do |format|
format.html
format.json{render json: @service_requests}
end
end

 def show
           @service_requests = ServiceRequest.find(params[:id])
           @linkreq= @service_requests.user
           #@service_requests = ServiceRequest.where(user_id: params[:user_id])
  end


  def completed_index
  
  @service_requests=ServiceRequest.where(status: "Completed")
respond_to do |format|
format.html
format.json{render json: @service_requests}
end
end


 def cancelled_index

  @service_requests=ServiceRequest.where(status: "Cancelled")
respond_to do |format|
format.html
format.json{render json: @service_requests}
end
end


def new
   @service_requests = ServiceRequest.new
end

 # api :POST, '/service_providers'
 # description 'Create new service_provider'
  def create
    @service_requests = ServiceRequest.new(service_requests_params)
    @current_date= DateTime.now.to_date
    @entered_date=params[:service_request][:date].to_date
    @time=Time.now
    @entered_time=params[:service_request][:request_time].to_time
     # @service_requests = ServiceRequest.new(service_requests_params)
     #end
     # @service = Service.new(service_params)
     if User.exists?(:id => service_requests_params[:user_id]) || OfflineUser.exists?(:id => service_requests_params[:user_id])
    if @entered_date < @current_date
             flash.now[:info] = "Please enter the correct date"
              render 'new'
    else          
    if @entered_date == @current_date
        if @entered_time < @time
            flash.now[:info] = "Please enter the correct time"
             render 'new'
         else
          data = @service_requests.save
                                   if data          
                                redirect_to service_requests_path
                                flash.now[:info] = "Service request is added." 
                                else
                                render 'new'
                                  end
         end
        else
             data = @service_requests.save
                                   if data          
                                redirect_to service_requests_path
                                flash.now[:info] = "Service request is added." 
                                else
                                render 'new'
                                  end
        end
    end
  else
        flash.now[:info] = "No user exists with this user id." 
        render 'new'
  end
  end

  def swap_status
      item = ServiceRequest.find(params[:id])
      @status=params[:status]
      @contactno=params[:contact_no] 
      @responsemsg = 'Your request has been received by us. A GoEazy Cook is assigned to you.Thank you for using GoEazy.Please call (9900956943) if you have any issues or queries.' 
      @completedmsg = 'Thank you for using GoEazy. Please drop a mesage on +91-9900956943 to give your feedback.Your feedback is valuable to us.'
      @cancelmsg = 'Your request has been cancelled. Please let us know at +91-9900956943 for any complains/queries.'

      if @status == "Processed"
      response = Exotel::Sms.send(:from => '80-395-13008', :to =>  @contactno  ,:priority => 'high' , 
      :body => @responsemsg  ) 
      end  
      if @status == "Completed"
      response = Exotel::Sms.send(:from => '80-395-13008', :to =>  @contactno  ,:priority => 'high' , 
      :body => @completedmsg  ) 
      end  
      if @status == "Cancelled"
      response = Exotel::Sms.send(:from => '80-395-13008', :to =>  @contactno  ,:priority => 'high' , 
      :body => @cancelmsg  ) 
      end  

      item.update_attribute(:status, @status)
      redirect_to dashboard_index_path
   end


     Exotel.configure do |c|
  c.exotel_sid   = "hszenoverslwebtechnologies"
  c.exotel_token = "ec3135588b989f8f15d20c85f00f4ba736b6fa92"
  end


def edit
    @service_requests = ServiceRequest.find(params[:id])
  end

  def update
    @service_requests = ServiceRequest.find(params[:id])
    if @service_requests.update_attributes(service_requests_params)
      flash.now[:success] = "Request updated"
      redirect_to @service_requests
    else
      render "edit"
    end
end

def service_requests_params
      params.require(:service_request).permit(:id, :user_id,:date ,:address,:references, :status, :request_time, :promised_time,:service_provider,:service_provider_id)
end



end