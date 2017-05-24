class Purchase < ApplicationRecord
  enum status: [:lunas, :belum_lunas, :retur]
  belongs_to :supplier
  belongs_to :user
end
