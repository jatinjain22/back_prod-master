class AaddtableCookstatus < ActiveRecord::Migration

  def up
  	  create_table :cookstatus do |t|
      t.string :cookstatus
 	  t.string :available_time	

      t.timestamps null: false
  end
  end

  def down
  end



end
