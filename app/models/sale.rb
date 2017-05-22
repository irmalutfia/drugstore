class Sale < ApplicationRecord
  belongs_to :user
  has_many :sales_details
  has_many :drugs
  accepts_nested_attributes_for :sales_details, allow_destroy: true
  validates :date, presence: true
  # accepts_nested_attributes_for :drugs, allow_destroy: true
end
