require 'rails_helper'

RSpec.describe Movie, type: :model do
  describe 'validations' do
    describe 'with subject' do
      subject { build(:movie) }
      
      it { is_expected.to validate_presence_of(:name) }
      it { is_expected.to validate_presence_of(:thumbnail) }
      it { is_expected.to validate_presence_of(:image) }
      it { is_expected.to validate_presence_of(:market_price) }
      it { is_expected.to validate_uniqueness_of(:name).scoped_to(:owner_id) }
    end
  end

  describe 'associations' do
    it { is_expected.to belong_to(:owner) }
    it { is_expected.to have_and_belong_to_many(:genres) }
  end

  describe 'callbacks' do
    it 'sets the parameterized name before saving' do
      movie = build(:movie)
      movie.save
      expect(movie.parameterized_name).to eq(movie.name.parameterize)
    end
  end
end
