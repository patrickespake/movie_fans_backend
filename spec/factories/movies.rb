FactoryBot.define do
  factory :movie do
    name { Faker::Movie.title }
    thumbnail { "http://dummyimage.com/100x100.png/5fa2dd/ffffff" }
    image { "http://dummyimage.com/400x.png/dddddd/000000" }
    market_price { 25.19 }
    owner
    genres { [create(:genre)] }
  end
end
