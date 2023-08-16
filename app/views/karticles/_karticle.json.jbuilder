json.extract! karticle, :id, :content, :kuser_id, :created_at, :updated_at
json.url karticle_url(karticle, format: :json)
