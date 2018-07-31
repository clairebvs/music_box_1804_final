require 'rails_helper'

describe "An admin" do
  describe 'visits genre index page' do
    it 'allows admin to see all genres' do
      admin = User.create(username: "Dee", password: 'password', role: 1)

      genre2 = Genre.create(name: 'Jazz')
      genre3 = Genre.create(name: 'Pop')

      allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(admin)

      visit admin_genres_path
      # expect(page).to have_content(genre.name)
      expect(page).to have_content(genre2.name)
      expect(page).to have_content(genre3.name)
    end

    it 'sees form to create new genre and goes to index genre and see new genre' do
    admin = User.create(username: "Dee", password: 'password', role: 1)
    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(admin)

    visit admin_genres_path
    save_and_open_page

    fill_in :genre_name, with: 'Funk'
    click_button 'Create Genre'

    expect(current_path).to eq(admin_genres_path)
    expect(page).to have_content('Funk')
  end
end
end
