# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
Dose.destroy_all
Ingredient.destroy_all

Ingredient.create(name: 'lemon')
Ingredient.create(name: 'ice')
Ingredient.create(name: 'mint leaves')

p "#{Ingredient.count} ingredients added"

require 'open-uri'
require 'json'

Cocktail.destroy_all

url = 'https://www.thecocktaildb.com/api/json/v1/1/list.php?i=list'
user = JSON.parse(open(url).read)
drinks = user['drinks'].first(10)
drinks.each do |drink|
  @cocktail = Cocktail.create(name: drink['strIngredient1'], remote_photo_url: "https://res.cloudinary.com/elisa/image/upload/v1575027383/q0v4myfkwsxju9ry0w9g.jpg")
  p @cocktail
end

p "#{Cocktail.count} cocktails added"
