require 'rails_helper'

RSpec.describe Movie, type: :model do
  describe 'validations' do
    describe 'with subject' do
      subject { build(:movie) }
      
      it { should validate_presence_of(:name) }
      it { should validate_presence_of(:thumbnail) }
      it { should validate_presence_of(:image) }
      it { should validate_presence_of(:market_price) }
      it { should validate_uniqueness_of(:name).scoped_to(:owner_id) }
      it { should validate_url_of(:thumbnail) }
      it { should validate_url_of(:image) }
    end
  end

  describe 'associations' do
    it { should belong_to(:owner) }
    it { should have_and_belong_to_many(:genres) }
  end

  describe 'callbacks' do
    it 'sets the parameterized name before saving' do
      movie = build(:movie)
      movie.save
      expect(movie.parameterized_name).to eq(movie.name.parameterize)
    end
  end
end
