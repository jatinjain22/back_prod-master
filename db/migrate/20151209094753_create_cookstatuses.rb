class CreateCookstatuses < ActiveRecord::Migration
  def change
    create_table :cookstatuses do |t|
      t.string :status
      t.string :available_time

      t.timestamps null: false
    end
  end
end
