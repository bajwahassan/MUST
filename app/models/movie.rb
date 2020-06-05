class Movie < ApplicationRecord
  has_many :genres
  belongs_to :watchlist
end
