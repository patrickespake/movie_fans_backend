require 'csv'

file = Rails.root.join("db", "the-movies-collection-dummies.csv")
CSV.foreach(file, headers: true) do |row|
  # Find or create the owner for this movie
  owner = Owner.find_or_create_by(name: row["owner"])

  # Find or create the genres for this movie
  genres = row["genre"].split("|").map do |genre_name|
    Genre.find_or_create_by(name: genre_name)
  end

  # Create the movie
  movie = Movie.create!(
    name: row["name"],
    thumbnail: row["thumbnail"],
    image: row["image"],
    market_price: row["market price"].gsub("$", "").to_f,
    owner: owner,
    genres: genres
  )

  puts "Created movie: #{movie.name}"
end