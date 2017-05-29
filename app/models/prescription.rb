class Prescription < ApplicationRecord
  has_many :prescription_details, dependent: :destroy
  accepts_nested_attributes_for :prescription_details, allow_destroy: true
end
