json.array!(@articles) do |article|
  json.extract! article, :id, :title, :body, :author_id, :deleted_at
  json.url article_url(article, format: :json)
end
