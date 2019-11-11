require "json"
require "open-uri"

url = 'http://www.omdbapi.com/?i=tt3896198&apikey=c799fbe5&s=star+wars'
data = open(url).read
movies = JSON.parse(data)

movies["Search"].each do |movie|
    Movie.create!(name: movie["Title"], photo: movie["Poster"], genre: "Science Fiction")
end



