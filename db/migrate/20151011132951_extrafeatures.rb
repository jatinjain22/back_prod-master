class Extrafeatures < ActiveRecord::Migration

  def up
  	 change_column :service_requests, :user_id, :integer, default: nil
  end

  def down
  	 change_column :service_requests, :user_id, :integer, default: 1
  end

end
