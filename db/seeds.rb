require "json"
require "open-uri"

keywords = ['star+wars', 'harry+potter', 'fast+and+furious', 'pokemon']
info = []

keywords.each do |key|
  url = "http://www.omdbapi.com/?i=tt3896198&apikey=c799fbe5&s=#{key}"
  data = open(url).read
  movies = JSON.parse(data)
  info << movies["Search"]
end

info.each do |array|
  array.each do |movie|
    Movie.create!(name: movie["Title"], photo: movie["Poster"], genre: "Science Fiction")
  end
end
