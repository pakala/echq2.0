json.array!(@cheques) do |cheque|
  json.extract! cheque, :id, :date, :amount, :amount_text, :recipient_id
  json.url cheque_url(cheque, format: :json)
end
