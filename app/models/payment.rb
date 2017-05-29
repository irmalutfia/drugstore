class Payment < ApplicationRecord
  has_many :payment_details
  belongs_to :purchase
end
