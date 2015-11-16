password = "passwordpassword"

20.times do
  user = User.new
  user.email = Faker::Internet.email
  user.password = password
  user.first_name = Faker::Name.name
  user.last_name = Faker::Name.name
  puts "Welcome " + user.first_name if user.save
end
User.populate_picture!

[
  {name: 'Café', icon: 'ion:coffee'},
  {name: 'Exposition', icon: 'stroke7:culture'},
  {name: 'Sport', icon: 'ion:ios-basketball"'},
  {name: 'Film', icon: 'ion:ios-monitor'},
  {name: 'Chez moi', icon: 'ion:android-home'},
  {name: 'Jeux', icon: 'ion:ios-game-controller-a'},
  {name: 'Balade', icon: 'ion:ios-sunny'},
  {name: 'Shopping', icon: 'ion:ios-pricetag'},
  {name: 'Boire un verre', icon: 'ion:beer'}
].each do |item|
  activity = Activity.new
  activity.name = item[:name]
  activity.icon = item[:icon]
  activity.save
end
Activity.populate!
