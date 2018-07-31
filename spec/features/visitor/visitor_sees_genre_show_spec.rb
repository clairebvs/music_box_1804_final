require 'rails_helper'

describe 'a visitor' do
  describe 'visiting genre show page' do
    it 'sees the songs for this genre' do
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
  When I visit the genre index page,
    I cannot see the form to create new genres,
      And I do not have access to any routes that could create a genre.
    And each genre's name should be a link to that genre's show page.

Testing requirements:
- I should see at least 2 genres listed
- All users of the web site see the genres' names as links
=end
