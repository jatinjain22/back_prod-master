class Adddatecolumn < ActiveRecord::Migration

  def up
  	add_column("service_requests","date",:date)
  end

  def down
  end


end
