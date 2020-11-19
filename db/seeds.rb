# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
#/db/seeds.rb
# require 'open-uri' 

Story.delete_all
Newsletter.delete_all

# url = URI("https://lyra-api.herokuapp.com/api/stories")

# https = Net::HTTP.new(url.host, url.port);
# https.use_ssl = true

# request = Net::HTTP::Get.new(url)
# request["Authorization"] = "Bearer WBktXBdQAGL717bfLaUMbRr2"
# response = https.request(request)

# stories = JSON.parse(response.body)["data"]
# stories.each do |story|
# Story.create!({
#   title: story["date"],
#   body: story["body"],
#     lyraID: story["lyraID"]
#     })
#   end
# end
  
# url = "https://lyra-api.herokuapp.com/api/newsletters"

# https = Net::HTTP.new(url.host, url.port);
# https.use_ssl = true

# request = Net::HTTP::Get.new(url)
# request["Authorization"] = "Bearer WBktXBdQAGL717bfLaUMbRr2"
# response = https.request(request)

# stories = JSON.parse(response.body)["data"]
# stories.each do |story|
# Story.create!({
#   title: story["date"],
#   html: story["html"],
#     lyraID: story["lyraID"]
#     })
#   end
# end