# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
john = Owner.create(name: 'John Smith', phone: '9876788998', email: 'John@example.com')
terrace = john.terraces.create(capacity: 30, location: 'location 1', rent: 999, area: 888)
terrace.availabilities.create(date: Date.parse('14 Jan 2015'))

taylor = Owner.create(name: 'Cherry Taylor', phone: '1232183912', email: 'cherry@example.com')
terrace = taylor.terraces.create(capacity: 10, location: 'location 2', rent: 1999, area: 1888)
terrace.availabilities.create(date: Date.parse('14 Jan 2015'))
terrace.availabilities.create(date: Date.parse('15 Jan 2015'))

alex = Owner.create(name: 'Alex Patrick', phone: '1232183912', email: 'alex@example.com')
terrace = alex.terraces.create(capacity: 10, location: 'location 2', rent: 100.0, area: 899.18)
terrace.availabilities.create(date: Date.parse('14 Jan 2015'))
terrace.availabilities.create(date: Date.parse('15 Jan 2015'))
