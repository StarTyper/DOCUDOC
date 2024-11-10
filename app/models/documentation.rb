class Documentation < ApplicationRecord
  belongs_to :client
  has_many :sections
end
