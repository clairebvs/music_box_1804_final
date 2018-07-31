require 'rails_helper'

describe "An admin" do
  describe 'visits genre index page' do
    it 'allows admin to see all genres and form to create new genre' do
      admin = User.create(username: "Dee", password: 'password', role: 1)
      genre = Genre.create(name: 'Opera')
      genre2 = Genre.create(name: 'Jazz')
      genre3 = Genre.create(name: 'Pop')

      allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(admin)

      visit admin_genres_path
      expect(page).to have_content(genre.name)
      expect(page).to have_content(genre2.name)
      expect(page).to have_content(genre3.name)

      fill_in :genre_name, with: 'Rock'
      click_button 'Create Genre'
    end
  end
end

=begin
As an admin user,
  When I visit the same genre index page that visitors see,
  I see the same information visitors see,
    And I also see a form to create a new genre.

Testing requirements:
- users should see at least 2 genres listed on the page
=end
