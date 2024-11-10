class Client < ApplicationRecord
  has_many :users
  has_many :locations
  has_many :documentations
end
