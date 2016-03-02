json.array!(@recurrings) do |recurring|
  json.extract! recurring, :id, :user_id, :recurring_flag, :last_date, :
  json.url recurring_url(recurring, format: :json)
end
