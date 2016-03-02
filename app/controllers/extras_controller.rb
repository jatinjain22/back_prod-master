class ExtrasController < ApplicationController

	def tandc
		@tandc="This agreement sets forth the terms and conditions of the Client's use of the Go Eazy Mobile Phone Application ('Application'). By using the Application, you, the Client, agree to be bound by the terms of this agreement and the Go Eazy's general terms and conditions.\n
The Application permits Clients to purchase domain names, search domains and their availability, keep a history of searches and check current Go Eazy offers through their mobile phone or handheld device ('the Services')
1. System Requirements
 	1.1 In order to use the Application, the client is required to have a compatible handheld device, internet access, and the necessary minimum specifications ('Software Requirements').
	1.2 The Software Requirements are as follows:
	Android platform; any mobile phone, tablet or player which runs Android.
	Android OS 4.1 or later.
	Language: English
	Memory Storage: 2MB or as specified as advertised elsewhere. The Client hereby acknowledges that these may change from time to time, without notice, and thatGo Eazy makes no representations as to the accuracy of the Software Requirements defined in this clause.
	1.3 The Client may be required to obtain software and / or hardware updates or upgrades from time to time as may be necessary for the continued use of the Application.
	1.4 The Client hereby acknowledges and agrees that such system requirements as specified under this clause 1 remain their responsibility.
2. Service Delivery
	2.1 The Client acknowledges that given the nature of such Services, Go Eazy cannot guarantee that the Services will be uninterrupted or error free.
	2.2 Go Eazy warrants that it will provide the Services with reasonable care and skill.
	2.3 The Client acknowledges that Go Eazy gives no warranty  that:
	2.3.1 The Services will meet the client's requirements.
	2.3.2 The Services will be provided on an uninterrupted timely, secure or error-free basis.
	2.3.3 Any results obtained from use of the Services will be accurate, complete or current.
3. Charges
	3.1 Go Eazy will not charge the Client for use of the Application, other than those provided for when booking a cooking service through the Application.
	3.2 The Client acknowledges that the Client's terms of agreement with their respective mobile network provider ('Mobile Provider') will continue to apply when using this application. As a result, the Client may be charged by the Mobile Provider for access to network connection services for the duration of the connection while accessing the Services, or any such third party charges as may arise.
	3.3 The Client accepts responsibility for any such charges that arise under clause 3.2.
	3.4 If the Client is not the bill payer for the mobile phone or handheld device being used to access the Services, the Client will be assumed to have received permission from the bill payer for using the Application.
4. Additional Reservation of Rights
	4.1 Go Eazy reserves the right to change, add, subtract or in any way alter these Conditions without the prior consent of the Client.
5. Severability
	5.1 The illegality, invalidity or unenforceability of any provision of the Agreement will not affect the legality, validity or enforceability of the remainder. If any such provision is found by any court or competent authority to be illegal, invalid or unenforceable, the parties agree that they will substitute provisions in a form as similar to the offending provisions as is possible without thereby rendering them illegal, invalid or unenforceable.
6. Definitions & Conflicts
	6.1 Terms used but not defined herein shall have the meanings ascribed to them in the Go Eazy general terms of service.
	6.2 In the event there is a conflict between the provisions of the General Terms of Service the provisions of this Agreement shall control.
	
7. Business to Business
    7.1 Cooks will wear our uniform.       
    7.2 Assistant will only help our chef .
    7.3 In Advance,Venue and Party Size should be mentioned
    7.4 In case of any failure you are liable to pay full amount and cook can leave.
    7.5 They are Chef no maids,helper or worker.
    7.6 Price is 2.5 rs/min with Marketing "
#sms_id = response.sid #sid is used to find the delivery status and other details of the message in future.
   #render :text => Exotel::Sms.details(sms_id)
render :text => @tandc
	#	render :text => @tandc
	end

	def ratecard
		@rate="Enjoy the cook service at your doorstep,Pay ₹ 2/minute on weekdays and ₹ 2.5/minute on weekend"
		render :text => @rate
	end

	def cookstatus
		@st=Cookstatus.find(1)
		puts "goeazy"
		puts @st.status
		puts "goeazy"
		puts @st.available_time
	    @status="true";
		render :text => @st.status
	end

	def insertcookstatus
	 @cook = Cookstatus.new(cook_params)
     data = @cook.save
     if data 
      redirect_to dashboard_index_path
     end
	end


	Exotel.configure do |c|
    c.exotel_sid   = "hszenoverslweb"
    c.exotel_token = "da01f50febb342914168bc49303df6d2393792a3"
    end

    def cook_params
      params.require(:cookstatus).permit(:cookstatus,:available_time)
     end

end
