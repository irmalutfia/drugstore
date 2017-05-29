class Purchase < ApplicationRecord
  has_many :payments
  has_many :payment_details, through: :payments
  enum status: [:lunas, :belum_lunas, :retur]
  belongs_to :supplier
  belongs_to :user
end
