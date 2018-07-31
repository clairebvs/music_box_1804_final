require 'rails_helper'

describe 'a visitor' do
  describe 'visiting song show page' do
    it 'sees the numeric rating for this song' do
       artist = Artist.create(name: 'Celine')
       song = Song.create(title: 'One', length: 12, play_count: 34, artist_id: artist.id, rating: 4)

       visit song_path(song)

       expect(page).to have_content(song.rating)
    end

    it 'sees heading and genres with this song' do
       artist = Artist.create(name: 'Celine')
       song = Song.create(title: 'One', length: 12, play_count: 34, artist_id: artist.id, rating: 4)
       genre = Genre.create(name: 'Opera')
       genre2 = Genre.create(name: 'Jazz')
       genre3 = Genre.create(name: 'Rock')
       genre_song = GenreSong.create(genre_id: genre.id, song_id: song.id)
       genre_song2 = GenreSong.create(genre_id: genre2.id, song_id: song.id)

       visit song_path(song)

       expect(page).to have_content("Genres for this Song:")
       expect(page).to_not have_content(genre3.name)
       expect(page).to have_content(genre.name)
       expect(page).to have_content(genre2.name)
    end
  end
end
