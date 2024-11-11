class Client < ApplicationRecord
  has_many :users, dependent: :destroy
  has_many :locations, dependent: :destroy
  has_many :documentations, dependent: :destroy
  has_many :rooms, through: :locations, dependent: :destroy

  validates :name, presence: true, uniqueness: true
end
