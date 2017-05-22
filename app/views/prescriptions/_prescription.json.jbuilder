json.extract! prescription, :id, :nama_dokter, :nama_apoteker, :created_at, :updated_at
json.url prescription_url(prescription, format: :json)
