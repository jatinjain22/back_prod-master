class Addchanges < ActiveRecord::Migration
 
  def up
  	change_column("users", "contact_no" , :bigint)
  end

  def down
  end

end
