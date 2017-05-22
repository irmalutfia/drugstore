json.extract! prescription_detail, :id, :qty, :price, :drug_id, :prescription_id, :created_at, :updated_at
json.url prescription_detail_url(prescription_detail, format: :json)
