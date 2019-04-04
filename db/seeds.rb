# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
require 'json'
require 'open-uri'

puts 'Creating ingredients...'

url = 'https://www.thecocktaildb.com/api/json/v1/1/list.php?i=list'
user_serialized = open(url).read
ingredients = JSON.parse(user_serialized)

ingredients['drinks'].each do |ingredient|
  ing = Ingredient.create(name: ingredient["strIngredient1"])
end

puts 'Finished ingredients!'

puts 'Creating cocktails...'

cocktail = Cocktail.new( name: "Mojito" )
cocktail.remote_photo_url = "https://cdn.liquor.com/wp-content/uploads/2018/09/04153106/mojito-720x720-recipe.jpg"
cocktail.save

cocktail = Cocktail.new(name: "Espresso martini")
cocktail.remote_photo_url = "https://cdn.diffords.com/contrib/stock-images/2016/8/34/2016514176701b5d0ff8e94868a69e73f511.jpg"
cocktail.save

cocktail = Cocktail.new(name: "Amaretto fizz")
cocktail.remote_photo_url = "https://media.monin.com/us/media/catalog/product/B/u/Butter_Pecan_Amaretto_Sour-1534129787-0.png"
cocktail.save

# cocktail = Cocktail.new( name: "Bitter orange & cardamom martinis" )
# cocktail.remote_photo_url = "https://www.bbcgoodfood.com/sites/default/files/styles/recipe/public/recipe_images/recipe-image-legacy-id--73620_10.jpg?itok=pqbEDV1V"
# cocktail.save


puts 'Finished cocktails!'
