class SalesDetail < ApplicationRecord
  belongs_to :drug
  belongs_to :sale
  belongs_to :prescription
end
