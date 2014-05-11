json.array!(@pet_considerings) do |pet_considering|
  json.extract! pet_considering, :id, :pet_id, :considering_id
  json.url pet_considering_url(pet_considering, format: :json)
end
