class CreateServiceRequests < ActiveRecord::Migration
  
  def up
    create_table :service_requests do |t|
      t.text :address
      t.string :request_time
      t.string :status
      t.string :promised_time
      t.string :references
      t.string :service_provider
      t.integer :user_id

      t.timestamps null: false
    end
  end

def down
  drop_table :service_requests
end

end
