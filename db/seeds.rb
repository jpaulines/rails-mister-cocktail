# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
require 'json'
require 'open-uri'

url = "https://www.thecocktaildb.com/api/json/v1/1/list.php?i=list"
ingredient_string = open(url).read
ingredients = JSON.parse(ingredient_string)

# Ingredient.create(name: "lemon")
# Ingredient.create(name: "ice")
# Ingredient.create(name: "mint leaves")

# check what is in the API p ingredients["drinks"]
# check what is in the API p ingredients["drinks"].size

puts "Creating your ingredient database"
Ingredient.destroy_all
puts "Cleaning the database first"
ingredients["drinks"].each do |ingredient|
  Ingredient.create(name: ingredient["strIngredient1"])
end
puts "Created a list of ingredients"

# check along the way before add create with rails db:seed
# do rails db:seed to create the database
# check in rails console: Ingredient.all.size
