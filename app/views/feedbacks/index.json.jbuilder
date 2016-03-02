json.array!(@feedbacks) do |feedback|
  json.extract! feedback, :id, :feedback, :rating
  json.url feedback_url(feedback, format: :json)
end
