# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ :name => 'Chicago' }, { :name => 'Copenhagen' }])
#   Mayor.create(:name => 'Daley', :city => cities.first)
user = User.new(:email => 'esha@gmail.com', :password => 'password', :password_confirmation => 'password', :admin => true )
user.admin = true
user.skip_confirmation!
user.save!

user1 = User.new(:email => 'someya@gmail.com', :password => 'vinsol', :password_confirmation => 'vinsol', :admin => false )
user1.admin = false
user1.skip_confirmation!
user1.save!