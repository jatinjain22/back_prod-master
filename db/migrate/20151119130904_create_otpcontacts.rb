class CreateOtpcontacts < ActiveRecord::Migration
  def change
    create_table :otpcontacts do |t|
      t.bigint :contactno
      t.integer :otp

      t.timestamps null: false
    end
  end
end
