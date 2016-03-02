json.array!(@offline_users) do |offline_user|
  json.extract! offline_user, :id, :name, :address, :contactno
  json.url offline_user_url(offline_user, format: :json)
end
