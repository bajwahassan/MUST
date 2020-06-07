class Movie < ApplicationRecord
  belongs_to :watchlist, optional: true
	has_many :movie_genres
	has_many :genres, through: :movie_genres

  validates :title, presence: true

  scope :by_year, -> { order("year desc")}
end
