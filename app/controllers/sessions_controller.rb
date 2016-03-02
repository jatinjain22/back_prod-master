class SessionsController < ApplicationController
  def new
  end

  def signin
  #user = User.where(:email => params[:session][:email].downcase).first
   #user = User.find_by_email(params[:email])
  user = User.authenticate(params[:session][:email], params[:session][:password])
#&& User.authenticate(params[:session][:password])
if user #&& user.authenticate(params[:password])
    session[:user_id] = user.id
    token = ApiKey.create!(:user_id=>user.id)
    msg =token.access_token 
    
 render json: {
                 status: 'success',
                 user: user,
                 token: msg
             }, status: 201

  else
    render json: {
                 status: 'errors',
                 errors: ["login failed` param."],
                 message: [:unprocessable_entity],
             }, status: 400
  end
  end

  def signout
   token = ApiKey.where(user_id: params[:api_key][:user_id])#, access_token: params[:access_token])
   session[:user_id] = nil
   #authenticate_or_request_with_http_token do |token, options|
      #token = ApiKey.find_by(access_token: token)
      if token != nil
        token.delete_all
      end
     render json: {
                 status: 'success',
                 message: "successful",
             }, status: 200
  end
  #end

def createotpforgot
@mobileno= params[:otpcontact][:contactno]
r = Random.new
r= r.rand(1000...9999)
@otp_row = Otpcontact.create(:contactno=> @mobileno   , :otp => r )
@message="Your one time password(OTP) is "+r.to_s;

response = Exotel::Sms.send(:from => '80-395-13008', :to =>  @mobileno ,:priority => 'high' , 
  :body => @message  )

render json: {
        status: 'success',
        message: @message,
    },status: 200

end


def verifyotpforgot
  @otp_row=Otpcontact.find_by_contactno(params[:otpcontact][:contactno] )    
    @otp=params[:otpcontact][:otp]
    puts "goeazy"
    @value=@otp_row.otp
    puts @otp
    puts @value
    puts @otp.to_i == @value.to_i
    if @otp.to_i == @value.to_i
      @message="true"
      puts "users entered the correct otp"
      @id=@otp_row.id
      Otpcontact.destroy(@id)
    else
      @message="false"
      puts " users did not enter the correct otp"
    end
    render json: {
        status: 'success',
        message: @message,
    },status: 200
  end
  

    Exotel.configure do |c|
  c.exotel_sid   = "hszenoverslwebtechnologies"
  c.exotel_token = "ec3135588b989f8f15d20c85f00f4ba736b6fa92"
end



  def verify_otp
    @otp_row=OtpTable.find_by_user_id(params[:otp_table][:user_id] )    
    @otp=params[:otp_table][:otp]
    puts "goeazy"
    @value=@otp_row.otp
    puts @otp
    puts @value
    puts @otp.to_i == @value.to_i
    if @otp.to_i == @value.to_i
      @message="true"
      puts "user entered the correct otp"
    else
      @message="false"
      puts " user did not enter the correct otp"
    end
    render json: {
        status: 'success',
        message: @message,
    },status: 200
  end


  def changepassword
   @users = User.find(params[:user][:id])
   if @users.update_attributes(user_params)
       render json: {
                 status: 'success',
                 data: @users
             }, status: 200
    else
      render json: {
                 status: 'error',
                 message: [:unprocessable_entity],
             }, status:400
    end
end

  private
  
  def ses_params
      params.require(:session).permit(:email , :password,:user_id)
  end

def user_params
      params.require(:user).permit(:id,:email , :password, :password_confirmation, :name, :token, :contact_no)
end

end

