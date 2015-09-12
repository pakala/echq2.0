json.array!(@recipients) do |recipient|
  json.extract! recipient, :id, :recipient_name, :customer_id
  json.url recipient_url(recipient, format: :json)
end
