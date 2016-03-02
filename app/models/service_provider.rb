class ServiceProvider < ActiveRecord::Base
	#attr_accessible :id, :status, :name, :description, :contactno ,:address

 validates_presence_of :name
 validates_presence_of :contactno

end
