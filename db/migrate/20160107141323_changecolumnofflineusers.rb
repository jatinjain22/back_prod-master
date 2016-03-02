class Changecolumnofflineusers < ActiveRecord::Migration
  
  def up
  		change_column :offline_users,:contactno, :text  
  end

  def down
  end

end
