require 'rails_helper'

describe 'a visitor' do
  describe 'visiting genre index page' do
    it 'sees the numeric rating for this song' do
       artist = Artist.create(name: 'Celine')
       song = Song.create(title: 'One', length: 12, play_count: 34, artist_id: artist.id, rating: 4)
       genre = Genre.create(name: 'Opera')
       genre2 = Genre.create(name: 'Jazz')
       genre3 = Genre.create(name: 'Pop')

       visit genres_path

       expect(page).to have_content(genre.name)
       expect(page).to have_content(genre2.name)
       expect(page).to have_content(genre3.name)
    end

    it 'cannot create new genre and genre title is link to genre show page' do
       artist = Artist.create(name: 'Celine')
       song = Song.create(title: 'One', length: 12, play_count: 34, artist_id: artist.id, rating: 4)
       genre = Genre.create(name: 'Opera')
       genre2 = Genre.create(name: 'Jazz')
       genre3 = Genre.create(name: 'Pop')

       visit genres_path

       expect(page).to_not have_content('Create Genre')

       within "#genre-#{genre.id}" do
         expect(page).to have_content(genre.name)
         click_link "#{genre.name}"
       end 
         expect(current_path).to eq(genre_path(genre))
    end
  end
end
