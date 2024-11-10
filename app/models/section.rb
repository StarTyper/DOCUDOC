class Section < ApplicationRecord
  belongs_to :documentation
  has_many :rows
end
