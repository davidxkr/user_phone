# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
1000.times do |i|
  user = User.create(name: "Test_#{i}")
  user.phones.create(number: "3121131234")
  user.phones.create(number: "3121131235")
  user.create_address(line1: "Av siempre viva 123", zip: '12345')
end