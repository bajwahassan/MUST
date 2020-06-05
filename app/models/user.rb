class User < ApplicationRecord
  has_many :watchlists
  has_many :movies, through: :watchlists

  has_secure_password
end
