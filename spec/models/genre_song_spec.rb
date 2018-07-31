require 'rails_helper'

describe GenreSong, type: :model do
  describe 'relationships' do
    it{should belong_to(:genres)}
    it{should belong_to(:songs)}
  end
end
