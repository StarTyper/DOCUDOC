class User < ApplicationRecord
  belongs_to :client

  validates :email, presence: true, format: { with: URI::MailTo::EMAIL_REGEXP, message: "must be a valid email address" },
                    uniqueness: true, length: { maximum: 255 }
  validates :username, presence: true, uniqueness: true
  validates :role, presence: true, inclusion: { in: %w[admin owner doctor assistant] }

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
end
