class OfflineUser < ActiveRecord::Base
	validates_presence_of :name
    validates_presence_of :contactno
end
