class User < ApplicationRecord
  has_many :watchlists
  has_many :movies, through: :watchlists

  validates :email, presence: true, uniqueness: true
  validates :name, presence: true

  has_secure_password
end
