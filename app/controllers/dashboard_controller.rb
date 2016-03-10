class DashboardController < ApplicationController
	before_action :authenticate_ops_user!
	def index
		@service_providers = ServiceProvider.all

		#@service_requests = ServiceRequest.all
		@service_processed=ServiceRequest.where(status: "Processed")
		@service_requests=ServiceRequest.where(status: "Pending")
		@service_cancelled=ServiceRequest.where(status: "Cancelled")

	end
end
