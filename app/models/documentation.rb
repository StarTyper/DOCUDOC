class Documentation < ApplicationRecord
  belongs_to :client
  has_many :sections, dependent: :destroy

  validates :name, presence: true
  validates :favorite, inclusion: { in: [true, false] }
end
