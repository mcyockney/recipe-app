# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
Chef.create(chefname: "Chef1", email: "Email@email.email") 

Chef.create(chefname: "Chef2", email: "Email2@email2.email2") 

Recipe.create(name: "Fish pie", summary: "A pie using fish", description: "first, get some fish, then make a pie", chef: Chef.last) 