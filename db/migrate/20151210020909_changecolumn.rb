class Changecolumn < ActiveRecord::Migration

  def up
  	change_column :cookstatuses,:status, :boolean
  end

  def down
  end

end
