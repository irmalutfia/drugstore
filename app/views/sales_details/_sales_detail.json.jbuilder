json.extract! sales_detail, :id, :qty, :drug_id, :sale_id, :prescription_id, :created_at, :updated_at
json.url sales_detail_url(sales_detail, format: :json)
