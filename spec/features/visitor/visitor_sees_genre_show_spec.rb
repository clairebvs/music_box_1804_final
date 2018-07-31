require 'rails_helper'

describe 'a visitor' do
  describe 'visiting genre show page' do
    it 'sees the numeric rating for this song' do
       artist = Artist.create(name: 'Celine')
       song = Song.create(title: 'One', length: 12, play_count: 34, artist_id: artist.id, rating: 4)
       song2 = Song.create(title: 'two', length: 1, play_count: 4, artist_id: artist.id, rating: 4)
       song3 = Song.create(title: 'three', length: 15, play_count: 54, artist_id: artist.id, rating: 4)
       genre = Genre.create(name: 'Opera')
       genre_song = GenreSong.create(genre_id: genre.id, song_id: song.id)
       genre_song2 = GenreSong.create(genre_id: genre.id, song_id: song2.id)


       visit genre_path(genre)

       expect(page).to have_content(genre.name)
       expect(page).to have_content(song.title)
       expect(page).to have_content(song2.title)
       expect(page).to_not have_content(song3.title)
    end
  end
end
=begin

As a Visitor,
  When I visit a genre show page,
    I see all songs associated with that genre listed on the page.

Testing requirements:
- I should see at least 2 songs listed for a genre
- Also include 1 or more songs that are NOT associated with this genre and ensure
  they do not appear on the page
=end
