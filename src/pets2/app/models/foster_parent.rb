class FosterParent < ActiveRecord::Base
  belongs_to :pet
  validates :name, :address, presence: true
  validates_format_of :email, :with => /\A[^@]+@([^@\.]+\.)+[^@\.]+\z/
end
