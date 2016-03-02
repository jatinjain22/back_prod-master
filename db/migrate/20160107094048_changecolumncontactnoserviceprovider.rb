class Changecolumncontactnoserviceprovider < ActiveRecord::Migration
  
  def up
  	change_column :service_providers,:contactno, :text
  end

  def down
  end

end
