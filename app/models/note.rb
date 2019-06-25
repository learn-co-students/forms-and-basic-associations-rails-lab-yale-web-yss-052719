class Note < ActiveRecord::Base
  # add associations here
  belongs_to :song
  has_many :artists, through: :songs
end
