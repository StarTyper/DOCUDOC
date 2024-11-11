class Section < ApplicationRecord
  belongs_to :documentation
  has_many :rows, dependent: :destroy

  validates :name, presence: true
end
