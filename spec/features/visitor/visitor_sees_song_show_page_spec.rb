require 'rails_helper'

describe 'a visitor' do
  describe 'visiting song show page' do
    it 'sees the numeric rating for this song' do
       artist = Artist.create(name: 'Celine')
       song = Song.create(title: 'One', length: 12, play_count: 34, artist_id: artist.id, rating: 4)

       visit song_path(song)

       expect(page).to have_content(song.rating)
    end
  end
end
