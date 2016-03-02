class UsersController < ApplicationController
  
  def new
  @users = User.new
end

def create
  #@reccount= params[:recurring_count]
  @users = User.new(user_params)
  if @users.save
  @apikey=ApiKey.create!(:user_id=>@users.id)
  @token=@apikey.access_token
  
@mobileno= params[:contact_no]
r = Random.new
r= r.rand(1000...9999)
@otp_row = OtpTable.create(:user_id=> @users.id , :otp => r )
@message="Your one time password(OTP) is "+r.to_s;
@mobileno=@users.contact_no
response = Exotel::Sms.send(:from => '80-395-13008', :to =>  @mobileno ,:priority => 'high' , 
  :body => @message  )
#sms_id = response.sid #sid is used to find the delivery status and other details of the message in future.
   # render :text => Exotel::Sms.details(sms_id)
    render json: {
                 status: 'success',
                 user: @users,
                 token: @token,
             }, status: 201
  else
   render json: {
                 status: 'error',
                 errors: ["User not saved"],
                 message: [:unprocessable_entity],
             }, status:400
  end
end

  Exotel.configure do |c|
  c.exotel_sid   = "hszenoverslwebtechnologies"
  c.exotel_token = "ec3135588b989f8f15d20c85f00f4ba736b6fa92"
end



  def index
    @users = User.all
     @online_users = User.all
    total = @users.count
    respond_to do |format|
    format.html
    format.json{   
    render json: {
               status: 'success',
               total: total,
               count: @users.count,
               data: @users,
           }, status: 200 }
      end
     end

def show
   @userid=params[:user_id]
           @users = User.find(@userid)
    render json: {
               status: 'success',
               user: @users,
           }, status: 200
end


def edit
    @users = User.find(params[:id])
end


def update
@user = User.find(params[:id])
   if @user.update_attributes(user_params)
       render json: {
                 status: 'success',
                 data: @user
             }, status: 200
    else
      render json: {
                 status: 'error',
                 message: [:unprocessable_entity],
             }, status:400
    end 
end

def changepassword
  @user = User.find_by_contact_no(params[:user][:contact_no])
  @new_password=params[:user][:password]
  @user.password=@new_password
    if @user.save
      @message="success"
       render json: {
                 status: 'success',
                 message: @new_password,
             }, status: 200
    else
      @message="not successful"
      render json: {
                 status: 'error',
                 message: @message,
             }, status:400
    end 
  end

private
def user_params
      params.require(:user).permit(:email , :password, :password_confirmation, :name, :token, :contact_no)
end
end
