class CreateApiKeys < ActiveRecord::Migration
  def change
    create_table :api_keys do |t|
      t.string :access_token
      t.integer :user_id
      t.datetime :expires_at
      t.integer :user_id
      t.boolean :active
      t.string :role

      t.timestamps null: false
    end
  end
end
