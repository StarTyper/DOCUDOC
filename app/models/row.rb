class Row < ApplicationRecord
  belongs_to :section
  has_many :values, dependent: :destroy

  validates :name, presence: true
  validates :type, presence: true, inclusion: { in: %w[Headline Free Dropdown Boolean] }
end
