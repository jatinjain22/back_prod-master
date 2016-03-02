class ServiceRequest < ActiveRecord::Base

 belongs_to :user 
 has_many :feedbacks 

 validates_presence_of :address
 validates_presence_of :request_time
 validates_presence_of :user_id


end
