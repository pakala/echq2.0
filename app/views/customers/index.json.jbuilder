json.array!(@customers) do |customer|
  json.extract! customer, :id, :cust_name
  json.url customer_url(customer, format: :json)
end
