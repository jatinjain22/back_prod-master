json.array!(@recurrings) do |recurring|
  json.extract! recurring, :id, :user_id, :recurring_flag, :lastdate, :
  json.url recurring_url(recurring, format: :json)
end
