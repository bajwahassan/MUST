class Watchlist < ApplicationRecord
  belongs_to :user
  has_many :movies

  validates :name, presence: true

end
