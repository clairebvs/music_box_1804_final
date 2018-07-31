require 'rails_helper'

describe Genre, type: :model do
  describe 'validations' do
    it{should validate_presence_of(:name)}
  end

  describe 'relationships' do
    it{should have_many(:genre_songs)}
    it{should have_many(:songs).through(:genre_songs)}
  end
end
