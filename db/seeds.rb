# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
Category.create(name: 'Batman', slug: 'Batman')
Category.create(name: 'Superman', slug: 'Superman')
Category.create(name: 'Kryptonite', slug: 'Kryptonite')
Category.create(name: 'Justice', slug: 'Justice')
Category.create(name: 'Mercy', slug: 'Mercy')
Category.create(name: 'Super Villains', slug: 'Super Villains')
Category.create(name: 'Sidekicks', slug: 'Sidekicks')
Category.create(name: 'Teams', slug: 'Teams')
Category.create(name: 'Super Powers', slug: 'Super Powers')

User.create(username: 'Cole Busby', password: 'jessica', slug: 'admin', role: 'admin')