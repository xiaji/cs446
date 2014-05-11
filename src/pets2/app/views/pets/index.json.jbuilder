json.array!(@pets) do |pet|
  json.extract! pet, :id, :name, :age, :breed, :habits, :image_url, :status
  json.url pet_url(pet, format: :json)
end
