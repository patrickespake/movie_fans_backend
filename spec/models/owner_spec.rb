require 'rails_helper'

RSpec.describe Owner, type: :model do
  describe 'validations' do
    describe 'with subject' do
      subject { build(:owner) }

      it { should validate_presence_of(:name) }
      it { should validate_uniqueness_of(:name) }
    end
    
    it "is valid with valid attributes" do
      expect(build(:owner)).to be_valid
    end

    it "is not valid without a name" do
      expect(build(:owner, name: nil)).to_not be_valid
    end

    it "is not valid with a duplicate name" do
      create(:owner, name: "John Doe")
      expect(build(:owner, name: "John Doe")).to_not be_valid
    end
  end

  describe 'associations' do
    it { should have_many(:movies).dependent(:destroy) }

    it "has many movies" do
      owner = create(:owner)
      movie1 = create(:movie, owner: owner)
      movie2 = create(:movie, owner: owner)
      expect(owner.movies).to include(movie1, movie2)
    end
  end

  describe 'callbacks' do
    it "sets the parameterized name before saving" do
      owner = build(:owner, name: "John Doe")
      owner.save
      expect(owner.parameterized_name).to eq("john-doe")
    end
  end
end
