class Row < ApplicationRecord
  belongs_to :section
  has_many :values
end
