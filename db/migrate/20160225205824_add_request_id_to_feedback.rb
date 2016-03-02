class AddRequestIdToFeedback < ActiveRecord::Migration
  def up
  	add_column("feedbacks","request_id",:integer)
  end
end
