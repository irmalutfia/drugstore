class Major < ApplicationRecord
  has_many :submajors
  accepts_nested_attributes_for :submajors, allow_destroy: true
end
