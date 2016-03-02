class AddUseridToApiKeys < ActiveRecord::Migration
  def change
    change_column :api_keys, :user_id, :integer
  end
end
