json.extract! expense, :id, :number, :value, :description, :references, :paid, :created_at, :updated_at
json.url expense_url(expense, format: :json)
