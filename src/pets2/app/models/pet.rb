class Pet < ActiveRecord::Base
  VALID_STATUSES = ["available", "fostered"]
  validates :name, :age, :species, presence: true
  validates :name, uniqueness: true
  validates :age, numericality: {greater_than_or_equal_to: 0}
  validates :image_url, :format => {
  :with => /\.(gif|jpg|png)\z/i,
  :message => 'must be a URL for GIF, JPG or PNG image'
  }
  has_many :pet_considerings
  before_destroy :ensure_not_referenced_by_any_pet_considering
  validates :status, inclusion: { in: VALID_STATUSES }

  private

  def ensure_not_referenced_by_any_pet_considering
    if pet_considerings.empty?
      return true
    else
      errors.add(:base, 'Pet considerings present')
      return false
    end
  end
end
