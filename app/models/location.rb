class Location < ApplicationRecord
  belongs_to :client
  has_many :rooms

  validates :name, presence: true
end
