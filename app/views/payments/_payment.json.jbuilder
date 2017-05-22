json.extract! payment, :id, :invoice, :total, :date, :status, :purchase_id, :created_at, :updated_at
json.url payment_url(payment, format: :json)
