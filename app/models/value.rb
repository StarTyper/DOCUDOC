class Value < ApplicationRecord
  belongs_to :row

  validates :content, presence: true
  validates :favorite, presence: true, inclusion: { in: [true, false] }
end
