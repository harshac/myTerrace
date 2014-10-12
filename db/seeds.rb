# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
harsha = Owner.create(name: 'Harsha', phone: '1232183912', email: 'lalala@lalala.com')
terrace = harsha.terraces.create(capacity: 30, location: 'location 1')
terrace.availabilities.create(date: Date.parse('14 Jan 2015'))