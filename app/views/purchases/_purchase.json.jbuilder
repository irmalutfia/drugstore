json.extract! purchase, :id, :date, :status, :supplier_id, :user_id, :created_at, :updated_at
json.url purchase_url(purchase, format: :json)
