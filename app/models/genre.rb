class Genre < ApplicationRecord
  has_many :movies, through: :watchlists
end
