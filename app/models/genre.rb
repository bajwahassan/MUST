class Genre < ApplicationRecord
  has_many :movie_genres
	has_many :movies, through: :movie_genres

  scope :red, -> { where(color: 'red') }
 
end
