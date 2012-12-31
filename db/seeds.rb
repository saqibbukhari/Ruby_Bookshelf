# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

Product.delete_all
#First Record
Product.create(title: 'HP Laptop V1.22 2013', description: 'This is a new series of 2013 laptops', image_url: '/images/ruby.jpg', price: '35000')
#end
