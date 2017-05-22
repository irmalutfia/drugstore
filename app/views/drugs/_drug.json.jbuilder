json.extract! drug, :id, :name, :stock, :unit, :price, :created_at, :updated_at
json.url drug_url(drug, format: :json)
