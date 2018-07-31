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

    it 'sees the average rating for all songs in this genre' do
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
      expect(page).to have_content('Average rating: 4')
    end

=begin
As a Visitor,
  When I visit a genre show page,
    I see the average rating for all songs in this genre

Testing requirements:
- I should add at least 2 songs for this genre
- Also include 1 or more songs NOT associated with this genre to ensure these
  other songs are not included in the average rating
=end
  end
end
