class CreateServiceProviders < ActiveRecord::Migration
  def change
    create_table :service_providers do |t|
      t.string :status
      t.string :name
      t.text :description
      t.integer :contactno
      t.text :address

      t.timestamps null: false
    end
  end
end
