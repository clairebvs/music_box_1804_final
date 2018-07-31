require 'rails_helper'

describe "An admin" do
  describe 'visits genre index page' do
    it 'allows admin to see all genres and form to create new genre and goes to index genre and see new genre' do
      admin = User.create(username: "Dee", password: 'password', role: 1)

      genre2 = Genre.create(name: 'Jazz')
      genre3 = Genre.create(name: 'Pop')

      allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(admin)

      visit admin_genres_path
      # expect(page).to have_content(genre.name)
      expect(page).to have_content(genre2.name)
      expect(page).to have_content(genre3.name)

      fill_in :genre_name, with: 'Funk'
      click_button 'Create Genre'

      expect(current_path).to eq(admin_genres_path)
      expect(page).to have_content('Funk')
    end

=begin
As an admin user,
  When I visit the genre index page,
    And I fill out the form with a new genre's name and submit that form,
  I return to the genre index page,
    And I see all previous genres and the new genre I have just created.

Testing requirements:
- I should see at least 2 previous genres listed plus the new genre
=end
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
