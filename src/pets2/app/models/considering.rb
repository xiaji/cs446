class Considering < ActiveRecord::Base
  has_many :pet_considerings, dependent: :destroy

  def add_pet_if_not_exists(pet_id)
    current = pet_considerings.find_by(pet_id: pet_id)
    if current == nil
      current = pet_considerings.build(pet_id: pet_id)
    end
    return current
  end
end
