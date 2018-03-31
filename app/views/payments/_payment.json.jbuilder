json.extract! payment, :id, :name, :money, :card, :created_at, :updated_at
json.url payment_url(payment, format: :json)
