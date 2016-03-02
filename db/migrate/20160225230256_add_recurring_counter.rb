class AddRecurringCounter < ActiveRecord::Migration
  def up
  	add_column("users","recurring_count",:integer)
  end
end
