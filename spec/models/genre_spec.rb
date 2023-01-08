require 'rails_helper'

RSpec.describe Genre, type: :model do
  describe 'validations' do
    describe 'with subject' do
      subject { build(:genre) }

      it { should validate_presence_of(:name) }
      it { should validate_uniqueness_of(:name) }
    end
    
    it "is valid with valid attributes" do
      expect(build(:genre)).to be_valid
    end

    it "is not valid without a name" do
      expect(build(:genre, name: nil)).to_not be_valid
    end

    it "is not valid with a duplicate name" do
      create(:genre, name: "Action")
      expect(build(:genre, name: "Action")).to_not be_valid
    end
  end

  describe 'associations' do
    it { should have_and_belong_to_many(:movies) }

    it "has and belongs to many movies" do
      genre = create(:genre)
      movie1 = create(:movie, genres: [genre])
      movie2 = create(:movie, genres: [genre])
      expect(genre.movies).to include(movie1, movie2)
    end
  end

  describe 'callbacks' do
    it "sets the parameterized name before saving" do
      genre = build(:genre, name: "Action & Adventure")
      genre.save
      expect(genre.parameterized_name).to eq("action-adventure")
    end
  end
end
