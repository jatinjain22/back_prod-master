class DsrController < ApplicationController
    
    before_action :authenticate_ops_user!
	def dsruser

    @users = User.all 
    @usertoday= User.where("created_at >= ?", Time.zone.now.beginning_of_day)
    @userthisweek = User.where("created_at > ?", Time.now-7.days)
    @userthismonth = User.where(:created_at => Time.now.beginning_of_month..Time.now.end_of_month)
    @userthisyear = User.where("created_at >= ?", Time.zone.now.beginning_of_year)
   
   end
 
   def dsrserreq
    
    @serreq = ServiceRequest.where(:status => "Completed")
    #@test = ServiceRequest.group(:user_id).order('count_user_id asc').count('user_id')
    #@foo = Foo.group('relation').order('count_id asc').count('id')
    @uniqreq = User.uniq.pluck(:id)
    @serreqtoday= ServiceRequest.where("created_at >= ? AND status = ?", Time.zone.now.beginning_of_day, "Completed")
    @serreqthisweek = ServiceRequest.where("created_at > ? AND status = ?", Time.now-7.days,"Completed")
    @serreqthismonth = ServiceRequest.where(:created_at => Time.now.beginning_of_month..Time.now.end_of_month,:status => "Completed")
    @serreqthisyear = ServiceRequest.where("created_at >= ? AND status = ?", Time.zone.now.beginning_of_year,"Completed")

    @serreqcan = ServiceRequest.where(:status => "Cancelled")
    @serreqtodaycan= ServiceRequest.where("created_at >= ? AND status = ?", Time.zone.now.beginning_of_day, "Cancelled")
    @serreqthisweekcan = ServiceRequest.where("created_at > ? AND status = ?", Time.now-7.days,"Cancelled")
    @serreqthismonthcan = ServiceRequest.where(:created_at => Time.now.beginning_of_month..Time.now.end_of_month,:status => "Cancelled")
    @serreqthisyearcan = ServiceRequest.where("created_at >= ? AND status = ?", Time.zone.now.beginning_of_year,"Cancelled")
   
   end

     
     def uniqreq
       #@test12 = ServiceRequest.count(:group  => "user_id",:select => "user_id, COUNT(*) as count")
     #@test12 = ServiceRequest.where(validated: true).order(:user_id).count(group: :user_id)
     @test12 = ServiceRequest.group(:user_id).count
     @linkuser= User.all
     @linkuser12 = OfflineUser.all
     end
  

end
