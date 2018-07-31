require 'rails_helper'

describe Genre, type: :model do
  describe 'validations' do
    it{should validate_presence_of(:name)}
  end

  describe 'relationships' do
    it{should have_many(:genre_songs)}
    it{should have_many(:songs).through(:genre_songs)}
  end

  describe 'instance method' do
    it 'calculate average rating songs of genre' do
    artist = Artist.create(name: 'Celine')
    song = Song.create(title: 'One', length: 12, play_count: 34, artist_id: artist.id, rating: 4)
    song2 = Song.create(title: 'two', length: 1, play_count: 4, artist_id: artist.id, rating: 4)
    genre = Genre.create(name: 'Opera')
    genre_song = GenreSong.create(genre_id: genre.id, song_id: song.id)
    genre_song2 = GenreSong.create(genre_id: genre.id, song_id: song2.id)

    expected_result = 4

    expect(genre.average_rating).to eq(expected_result)
  end 
  end
end
