class Genre < ActiveRecord::Base
  # add associations
  has_many :songs
  has_many :notes, through: :songs
  has_many :artist, through: :songs
end
