class CreateOfflineUsers < ActiveRecord::Migration
  
  def up
    create_table :offline_users do |t|
      t.string :name
      t.string :address
      t.integer :contactno

      t.timestamps null: false
    end
	end

	def down
	end
	
end
