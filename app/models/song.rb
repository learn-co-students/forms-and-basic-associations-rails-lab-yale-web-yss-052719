class Song < ActiveRecord::Base
  belongs_to :artist
  belongs_to :genre
  has_many :notes

  def genre_name=(name)
    self.genre = Genre.find_or_create_by(name: name)
  end

  def genre_name
    self.genre ? self.genre.name : nil
  end

  def artist_name=(name)
    self.artist = Artist.find_or_create_by(name: name)
  end

  def artist_name
    self.artist ? self.artist.name : nil
  end

  def note_contents=(content)
    content.each do |cont|
      if cont != ""
        this_note = Note.find_or_create_by(content: cont)
        self.notes << this_note
      end
    end
  end

  def note_contents
    the_contents = []
    self.notes.each do |note|
      the_contents << note.content
    end
    the_contents
  end

end
