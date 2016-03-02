class AddcolumnpreferenceSr < ActiveRecord::Migration

  def up
  	add_column("service_requests","preference",:string)
  end

  def down
  end

end
