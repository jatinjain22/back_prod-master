class AddColumnPartyGroceriesFlag < ActiveRecord::Migration
  def up
  	add_column("service_requests","party_order_flag",:boolean)
  	add_column("service_requests","groceries_flag",:boolean)
  end
end
