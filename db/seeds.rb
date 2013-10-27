# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

puts 'DEFAULT USERS'
user = Player.find_or_create_by_email :username => ENV['ADMIN_NAME'].dup, :email => ENV['ADMIN_EMAIL'].dup, :password => ENV['ADMIN_PASSWORD'].dup, :password_confirmation => ENV['ADMIN_PASSWORD'].dup, :admin => true, :confirmed_at => Time.now
puts 'user: ' << user.username
user.save!

user = Player.find_or_create_by_email :username => "Alice".dup, :email => "alice@test.org".dup, :password => "testpass".dup, :password_confirmation => "testpass".dup, :admin => false, :confirmed_at => Time.now
user.save!
puts 'user: ' << user.username

user = Player.find_or_create_by_email :username => "Bob".dup, :email => "bob@test.org".dup, :password => "testpass".dup, :password_confirmation => "testpass".dup, :admin => false, :confirmed_at => Time.now
user.save!
puts 'user: ' << user.username

user = Player.find_or_create_by_email :username => "Chad".dup, :email => "chad@test.org".dup, :password => "testpass".dup, :password_confirmation => "testpass".dup, :admin => false, :confirmed_at => Time.now
user.save!
puts 'user: ' << user.username

user = Player.find_or_create_by_email :username => "Diego".dup, :email => "diego@test.org".dup, :password => "testpass".dup, :password_confirmation => "testpass".dup, :admin => false, :confirmed_at => Time.now
user.save!
puts 'user: ' << user.username

puts 'TEST GAMES'
game = Game.new({:name => "emptyGame", :creator_id => 1})
game.save!
puts 'game: ' << game.name

game = Game.new({:name => "fullGame", :creator_id => 1})
game.players << Player.find(1)
game.players << Player.find(2)
game.players << Player.find(3)
game.turns << Turn.new
game.save!
puts 'game: ' << game.name