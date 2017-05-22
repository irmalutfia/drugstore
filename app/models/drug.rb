class Drug < ApplicationRecord
  validates :name, presence:true
  validates :name, uniqueness: true
  validates :stock, presence:true
  validates :price, presence:true

  scope :by_drug_name, -> keyword do where("lower(drugs.name) LIKE lower(?)", "%#{keyword}%")
  end
end
