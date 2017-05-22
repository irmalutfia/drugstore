json.extract! payment_detail, :id, :date, :cash, :debt, :qty, :unit, :drug_id, :created_at, :updated_at
json.url payment_detail_url(payment_detail, format: :json)
