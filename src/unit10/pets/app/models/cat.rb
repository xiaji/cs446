# validation
class Cat < ActiveRecord::Base
    has_many :line_items

    before_destroy :ensure_not_referenced_by_any_line_item
   #The field’s name, breed, age, gender, description, and image URL are not empty.
   validates :name, :breed, :age, :gender, :description, :image_url, presence: true
   #The  name cannot have less than 2 length
   validates :name, length: { minimum: 2 }
   #The age is a valid integer number not less than 0.
  validates :age, numericality: { only_integer: true,  greater_than_or_equal_to: 0}
  #The gender' values are included in a given set.
  validates :gender, inclusion: { in: %w(F M),
    message: '%{value} is not a valid gender(F/M)'}
# The image URL looks reasonable.
  validates :image_url, allow_blank: true, format: {
    with:    %r{\.(gif|jpg|png)\Z}i,
    message: 'must be a URL for GIF, JPG or PNG image.'
  }

  private
    # ensure that there are no line items referencing this product
    def ensure_not_referenced_by_any_line_item
      if line_items.empty?
        return true
      else
        errors.add(:base, 'Line Items present')
        return false
      end
    end
end
