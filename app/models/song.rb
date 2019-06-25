class Song < ActiveRecord::Base
  # add associations here
  has_many :notes
  belongs_to :artist
  belongs_to :genre

    def genre_name=(genre)
      self.genre = Genre.find_or_create_by(name: genre)
    end

    def genre_name
      self.genre ? self.genre.name : nil
    end

    def artist_name=(artist_name)
      self.artist = Artist.find_or_create_by(name: artist_name)
    end

    def artist_name
      self.artist ? self.artist.name : nil
    end

    def note_contents=(content)
      content.each do |content|
        self.notes << Note.find_or_create_by(content: content)
      end
    end
      
    def note_contents
      arr = []
      self.notes.each do |note|
        if !note.content.empty?
          arr << note.content
        end
      end
      arr
    end

end
