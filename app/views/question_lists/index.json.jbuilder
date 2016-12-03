json.array!(@question_lists) do |question_list|
  json.extract! question_list, :id, :title, :description
  json.url question_list_url(question_list, format: :json)
end
