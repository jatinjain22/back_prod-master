class CreateOtpTables < ActiveRecord::Migration
  def change
    create_table :otp_tables do |t|
      t.integer :user_id
      t.integer :otp

      t.timestamps null: false
    end
  end
end
