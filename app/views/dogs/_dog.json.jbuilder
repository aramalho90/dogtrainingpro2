json.extract! dog, :id, :name, :sex, :dob, :breed, :color, :weight, :chip, :vaccines, :canil, :allergies, :obs, :created_at, :updated_at
json.url dog_url(dog, format: :json)
