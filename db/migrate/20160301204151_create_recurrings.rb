class CreateRecurrings < ActiveRecord::Migration
  def change
    create_table :recurrings do |t|
      t.integer :user_id
      t.integer :recurring_flag
      t.string :lastdate
      

      t.timestamps null: false
    end
  end
end
