# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
Chef.create(chefname: "Matthew", email: "matthewy@gmail.com", admin: "t") 

Style.create(name: "Chinese")
Style.create(name: "Mexican")
Style.create(name: "Euopean")
Style.create(name: "Nouvelle Cuisine")

Ingredient.create(name: "Flour")
Ingredient.create(name: "Cream")
Ingredient.create(name: "Chicken")
Ingredient.create(name: "Beef")
Ingredient.create(name: "Lamb")
Ingredient.create(name: "Pork")
Ingredient.create(name: "Pasta")
Ingredient.create(name: "Rice")
Ingredient.create(name: "Couscous")
