# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
puts 'SETTING UP DEFAULT USER LOGIN'
user = User.create! :email => 'aaron@binaryitsystems.com', :password => 'password', :password_confirmation => 'password', :superuser => true, :tenant_id => 1
user.toggle!(:admin)
puts 'New user created: ' << user.email

puts 'SETTING UP DEFAULT TENANT'
tenant = Tenant.create! :name => 'Binary IT Systems'
puts 'New tenant created: ' << tenant.name
