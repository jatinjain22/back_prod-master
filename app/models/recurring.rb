class Recurring < ActiveRecord::Base
	validates_presence_of :user_id
	validates_presence_of :recurring_flag
	validates_presence_of :lastdate
end
