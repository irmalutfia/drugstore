class Member < ApplicationRecord
  SEXES = {Male: 1, Female: 2, Unknown: 3}
  enum sex: SEXES
  belongs_to :sale
  has_many :sales
  scope :by_member_name, -> keyword do
    where("lower(members.name) LIKE lower(?)", "%#{keyword}%")
  end

end
