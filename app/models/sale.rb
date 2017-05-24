class Sale < ApplicationRecord
  belongs_to :user
  has_many :sales_details
  has_many :drugs
  belongs_to :member
  validates :date, presence: true
  accepts_nested_attributes_for :sales_details, allow_destroy: true
end
