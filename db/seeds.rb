include ActionDispatch::TestProcess

puts "Seeding Roles"

admin_role = Role.create(name: "admin")
user_role  = Role.create(name: "user")

puts "Seeding Users"
admin_user = User.create(first_name: "admin_first", last_name: "admin_last", dob: "2016/6/16", city: "Halifax", province: "Nova Scotia", email: "admin@test.com", password: "password", role_ids: [admin_role.id], avatar: fixture_file_upload(File.join(Rails.root,"spec","fixtures","binaries","dog_1.jpg"),'image/jpg', "true"))

User.create(first_name: "user_first", last_name: "user_last", dob: "2016/6/16", city: "Halifax", province: "Nova Scotia", email: "user@test.com", password: "password",role_ids: [user_role.id], avatar: fixture_file_upload(File.join(Rails.root,"spec","fixtures", "binaries","dog_2.jpg"),'image/jpg', "true") )
User.create(first_name: "Dennis", last_name: "Ritche", dob: "2016/6/16", city: "Halifax", province: "Nova Scotia", email: "dennis@windymaple.com", password: "password", role_ids: [admin_role.id], avatar: fixture_file_upload(File.join(Rails.root,"spec","fixtures","binaries","headshots","dennis_ritche.jpg"),'image/jpg', "true"))
User.create(first_name: "Bjarne", last_name: "Stroustrup", dob: "2016/6/16", city: "Halifax", province: "Nova Scotia", email: "bjarne_stroustrup@windymaple.com", password: "password", role_ids: [admin_role.id], avatar: fixture_file_upload(File.join(Rails.root,"spec","fixtures","binaries","headshots","bjarne_stroustrup.jpg"),'image/jpg', "true"))
User.create(first_name: "Steve", last_name: "Wozniak", dob: "2016/6/16", city: "Halifax", province: "Nova Scotia", email: "steve@windymaple.com", password: "password", role_ids: [admin_role.id], avatar: fixture_file_upload(File.join(Rails.root,"spec","fixtures","binaries","headshots","steve_wozniak.jpg"),'image/jpg', "true"))
User.create(first_name: "Linus", last_name: "Torvalds", dob: "2016/6/16", city: "Halifax", province: "Nova Scotia", email: "linus@windymaple.com", password: "password", role_ids: [admin_role.id], avatar: fixture_file_upload(File.join(Rails.root,"spec","fixtures","binaries","headshots","linus_torvalds.jpg"),'image/jpg', "true"))

user_1 = User.create(first_name: "Adam", last_name: "West", dob: "2016/6/16", city: "Halifax", province: "Nova Scotia", email: "adam@windymaple.com", password: "password",role_ids: [user_role.id], avatar: fixture_file_upload(File.join(Rails.root,"spec","fixtures", "binaries","headshots","adam_west.jpg"),'image/jpg', "true") )
user_2 = User.create(first_name: "Al", last_name: "Pacino", dob: "2016/6/16", city: "Halifax", province: "Nova Scotia", email: "al@windymaple.com", password: "password",role_ids: [user_role.id], avatar: fixture_file_upload(File.join(Rails.root,"spec","fixtures", "binaries","headshots","al_pacino.jpg"),'image/jpg', "true") )
user_3 = User.create(first_name: "Angelina", last_name: "Jolie", dob: "2016/6/16", city: "Halifax", province: "Nova Scotia", email: "angelina@windymaple.com", password: "password",role_ids: [user_role.id], avatar: fixture_file_upload(File.join(Rails.root,"spec","fixtures", "binaries","headshots","angelina_jolie.jpg"),'image/jpg', "true") )
User.create(first_name: "Arnold", last_name: "Schwarzenegger", dob: "2016/6/16", city: "Halifax", province: "Nova Scotia", email: "arnold@windymaple.com", password: "password",role_ids: [user_role.id], avatar: fixture_file_upload(File.join(Rails.root,"spec","fixtures", "binaries","headshots","arnold_schwarzenegger.jpg"),'image/jpg', "true") )
User.create(first_name: "Bill", last_name: "Murray", dob: "2016/6/16", city: "Halifax", province: "Nova Scotia", email: "bill@windymaple.com", password: "password",role_ids: [user_role.id], avatar: fixture_file_upload(File.join(Rails.root,"spec","fixtures", "binaries","headshots","bill_murray.jpg"),'image/jpg', "true") )
User.create(first_name: "Brad", last_name: "Pitt", dob: "2016/6/16", city: "Halifax", province: "Nova Scotia", email: "brad@windymaple.com", password: "password",role_ids: [user_role.id], avatar: fixture_file_upload(File.join(Rails.root,"spec","fixtures", "binaries","headshots","brad_pitt.jpg"),'image/jpg', "true") )
User.create(first_name: "Bruce", last_name: "Lee", dob: "2016/6/16", city: "Halifax", province: "Nova Scotia", email: "bruce@windymaple.com", password: "password",role_ids: [user_role.id], avatar: fixture_file_upload(File.join(Rails.root,"spec","fixtures", "binaries","headshots","bruce_lee.jpg"),'image/jpg', "true") )
User.create(first_name: "Chris", last_name: "Rock", dob: "2016/6/16", city: "Halifax", province: "Nova Scotia", email: "chris@windymaple.com", password: "password",role_ids: [user_role.id], avatar: fixture_file_upload(File.join(Rails.root,"spec","fixtures", "binaries","headshots","chris_rock.jpg"),'image/jpg', "true") )
User.create(first_name: "Danny", last_name: "Devito", dob: "2016/6/16", city: "Halifax", province: "Nova Scotia", email: "danny@windymaple.com", password: "password",role_ids: [user_role.id], avatar: fixture_file_upload(File.join(Rails.root,"spec","fixtures", "binaries","headshots","danny_devito.jpg"),'image/jpg', "true") )
User.create(first_name: "Dwayne", last_name: "Johnson", dob: "2016/6/16", city: "Halifax", province: "Nova Scotia", email: "dwayne@windymaple.com", password: "password",role_ids: [user_role.id], avatar: fixture_file_upload(File.join(Rails.root,"spec","fixtures", "binaries","headshots","dwayne_johnson.jpg"),'image/jpg', "true") )
User.create(first_name: "Harrison", last_name: "Ford", dob: "2016/6/16", city: "Halifax", province: "Nova Scotia", email: "harrison@windymaple.com", password: "password",role_ids: [user_role.id], avatar: fixture_file_upload(File.join(Rails.root,"spec","fixtures", "binaries","headshots","harrison_ford.jpg"),'image/jpg', "true") )
User.create(first_name: "Hiroyuki", last_name: "Sanada", dob: "2016/6/16", city: "Halifax", province: "Nova Scotia", email: "hiroyuki@windymaple.com", password: "password",role_ids: [user_role.id], avatar: fixture_file_upload(File.join(Rails.root,"spec","fixtures", "binaries","headshots","hiroyuki-sanada.jpg"),'image/jpg', "true") )
User.create(first_name: "James", last_name: "Kirk", dob: "2016/6/16", city: "Halifax", province: "Nova Scotia", email: "james@windymaple.com", password: "password",role_ids: [user_role.id], avatar: fixture_file_upload(File.join(Rails.root,"spec","fixtures", "binaries","headshots","james_t_kirk.jpg"),'image/jpg', "true") )
User.create(first_name: "Ken", last_name: "Watanabe", dob: "2016/6/16", city: "Halifax", province: "Nova Scotia", email: "ken@windymaple.com", password: "password",role_ids: [user_role.id], avatar: fixture_file_upload(File.join(Rails.root,"spec","fixtures", "binaries","headshots","ken-watanabe.jpg"),'image/jpg', "true") )
User.create(first_name: "Lisa", last_name: "Ling", dob: "2016/6/16", city: "Halifax", province: "Nova Scotia", email: "lisa@windymaple.com", password: "password",role_ids: [user_role.id], avatar: fixture_file_upload(File.join(Rails.root,"spec","fixtures", "binaries","headshots","lisa_ling.jpg"),'image/jpg', "true") )
User.create(first_name: "Lucy", last_name: "Liu", dob: "2016/6/16", city: "Halifax", province: "Nova Scotia", email: "lucy@windymaple.com", password: "password",role_ids: [user_role.id], avatar: fixture_file_upload(File.join(Rails.root,"spec","fixtures", "binaries","headshots","lucy-liu.jpg"),'image/jpg', "true") )
User.create(first_name: "Mindy", last_name: "Kaling", dob: "2016/6/16", city: "Halifax", province: "Nova Scotia", email: "mindy@windymaple.com", password: "password",role_ids: [user_role.id], avatar: fixture_file_upload(File.join(Rails.root,"spec","fixtures", "binaries","headshots","mindy_kaling.jpg"),'image/jpg', "true") )
User.create(first_name: "Morgan", last_name: "Freeman", dob: "2016/6/16", city: "Halifax", province: "Nova Scotia", email: "morgan@windymaple.com", password: "password",role_ids: [user_role.id], avatar: fixture_file_upload(File.join(Rails.root,"spec","fixtures", "binaries","headshots","morgan_freeman.jpg"),'image/jpg', "true") )
User.create(first_name: "Nyota", last_name: "Uhura", dob: "2016/6/16", city: "Halifax", province: "Nova Scotia", email: "nyota@windymaple.com", password: "password",role_ids: [user_role.id], avatar: fixture_file_upload(File.join(Rails.root,"spec","fixtures", "binaries","headshots","nyota_uhura.jpg"),'image/jpg', "true") )
User.create(first_name: "Elizabeth", last_name: "Windsor", dob: "2016/6/16", city: "Halifax", province: "Nova Scotia", email: "elizabeth@windymaple.com", password: "password",role_ids: [user_role.id], avatar: fixture_file_upload(File.join(Rails.root,"spec","fixtures", "binaries","headshots","queen_elizabeth_ii.jpg"),'image/jpg', "true") )
User.create(first_name: "Santa", last_name: "Clause", dob: "2016/6/16", city: "Halifax", province: "Nova Scotia", email: "santa@windymaple.com", password: "password",role_ids: [user_role.id], avatar: fixture_file_upload(File.join(Rails.root,"spec","fixtures", "binaries","headshots","santa_clause.jpg"),'image/jpg', "true") )
User.create(first_name: "Steve", last_name: "Jobs", dob: "2016/6/16", city: "Halifax", province: "Nova Scotia", email: "steve@windymaple.com", password: "password",role_ids: [user_role.id], avatar: fixture_file_upload(File.join(Rails.root,"spec","fixtures", "binaries","headshots","steve_jobs.jpg"),'image/jpg', "true") )
User.create(first_name: "Stewart", last_name: "Patrick", dob: "2016/6/16", city: "Halifax", province: "Nova Scotia", email: "stewart@windymaple.com", password: "password",role_ids: [user_role.id], avatar: fixture_file_upload(File.join(Rails.root,"spec","fixtures", "binaries","headshots","stewart_patrick.jpg"),'image/jpg', "true") )
User.create(first_name: "Tom", last_name: "Hank", dob: "2016/6/16", city: "Halifax", province: "Nova Scotia", email: "tom@windymaple.com", password: "password",role_ids: [user_role.id], avatar: fixture_file_upload(File.join(Rails.root,"spec","fixtures", "binaries","headshots","tom_hank.jpg"),'image/jpg', "true") )
User.create(first_name: "Marilyn", last_name: "Monroe", dob: "2016/6/16", city: "Halifax", province: "Nova Scotia", email: "Marilyn@windymaple.com", password: "password",role_ids: [user_role.id], avatar: fixture_file_upload(File.join(Rails.root,"spec","fixtures", "binaries","headshots","marilyn_monroe.jpg"),'image/jpg', "true") )

puts "Seeding Communities"
community_1 = Community.create(name: "Trucks",status_id: "0", banner: fixture_file_upload(File.join(Rails.root,"spec","fixtures", "binaries","dog_1.jpg"),'image/jpg', "true"), avatar: fixture_file_upload(File.join(Rails.root,"spec","fixtures", "binaries","dog_1.jpg"),'image/jpg', "true") )
community_2 = Community.create(name: "Cars",status_id: "0", banner: fixture_file_upload(File.join(Rails.root,"spec","fixtures", "binaries","dog_2.jpg"),'image/jpg', "true"), avatar: fixture_file_upload(File.join(Rails.root,"spec","fixtures", "binaries","dog_2.jpg"),'image/jpg', "true") )
community_3 = Community.create(name: "Planes",status_id: "0", banner: fixture_file_upload(File.join(Rails.root,"spec","fixtures", "binaries","dog_1.jpg"),'image/jpg', "true"), avatar: fixture_file_upload(File.join(Rails.root,"spec","fixtures", "binaries","dog_1.jpg"),'image/jpg', "true") )
community_4 = Community.create(name: "Trains",status_id: "0", banner: fixture_file_upload(File.join(Rails.root,"spec","fixtures", "binaries","dog_2.jpg"),'image/jpg', "true"), avatar: fixture_file_upload(File.join(Rails.root,"spec","fixtures", "binaries","dog_2.jpg"),'image/jpg', "true") )
community_5 = Community.create(name: "Boats",status_id: "0", banner: fixture_file_upload(File.join(Rails.root,"spec","fixtures", "binaries","dog_1.jpg"),'image/jpg', "true"), avatar: fixture_file_upload(File.join(Rails.root,"spec","fixtures", "binaries","dog_1.jpg"),'image/jpg', "true") )
community_6 = Community.create(name: "Bikes",status_id: "0", banner: fixture_file_upload(File.join(Rails.root,"spec","fixtures", "binaries","dog_2.jpg"),'image/jpg', "true"), avatar: fixture_file_upload(File.join(Rails.root,"spec","fixtures", "binaries","dog_2.jpg"),'image/jpg', "true") )
community_7 = Community.create(name: "Submarines",status_id: "0", banner: fixture_file_upload(File.join(Rails.root,"spec","fixtures", "binaries","dog_1.jpg"),'image/jpg', "true"), avatar: fixture_file_upload(File.join(Rails.root,"spec","fixtures", "binaries","dog_1.jpg"),'image/jpg', "true") )
community_8 = Community.create(name: "Skateboards",status_id: "0", banner: fixture_file_upload(File.join(Rails.root,"spec","fixtures", "binaries","dog_2.jpg"),'image/jpg', "true"), avatar: fixture_file_upload(File.join(Rails.root,"spec","fixtures", "binaries","dog_2.jpg"),'image/jpg', "true") )
community_9 = Community.create(name: "Monster Trucks",status_id: "0", banner: fixture_file_upload(File.join(Rails.root,"spec","fixtures", "binaries","dog_1.jpg"),'image/jpg', "true"), avatar: fixture_file_upload(File.join(Rails.root,"spec","fixtures", "binaries","dog_1.jpg"),'image/jpg', "true") )
community_10 = Community.create(name: "Space Ships",status_id: "0", banner: fixture_file_upload(File.join(Rails.root,"spec","fixtures", "binaries","dog_2.jpg"),'image/jpg', "true"), avatar: fixture_file_upload(File.join(Rails.root,"spec","fixtures", "binaries","dog_2.jpg"),'image/jpg', "true") )
community_11 = Community.create(name: "Long Haul Trucks",status_id: "0", banner: fixture_file_upload(File.join(Rails.root,"spec","fixtures", "binaries","dog_1.jpg"),'image/jpg', "true"), avatar: fixture_file_upload(File.join(Rails.root,"spec","fixtures", "binaries","dog_1.jpg"),'image/jpg', "true") )
community_12 = Community.create(name: "Yatchs",status_id: "0", banner: fixture_file_upload(File.join(Rails.root,"spec","fixtures", "binaries","dog_2.jpg"),'image/jpg', "true"), avatar: fixture_file_upload(File.join(Rails.root,"spec","fixtures", "binaries","dog_2.jpg"),'image/jpg', "true") )

puts "Seeding Posts"

for iteration in 1..5
  first_four = rand(5000).to_s
  last_two = rand(99).to_s
  amount = first_four + "." + last_two

  post = Post.create(
    user: admin_user,
    avatar: fixture_file_upload(File.join(Rails.root,"spec","fixtures", "binaries","cars","#{iteration}.jpg"),'image/jpg', "true"),
    title: Faker::Hipster.sentence,
    price: Faker::Number.decimal(2),
    content: Faker::ChuckNorris.fact,
    community_ids:[community_1.id],
    photos_attributes:[ { pic: fixture_file_upload(File.join(Rails.root,"spec","fixtures", "binaries","cars","#{iteration}.jpg"),'image/jpg', "true")},{ pic: fixture_file_upload(File.join(Rails.root,"spec","fixtures", "binaries","cars","#{rand(1..20)}.jpg"),'image/jpg', "true")} ]
  )

  #post.communities << community_1


end
for iteration in 6..10
  first_four = rand(5000).to_s
  last_two = rand(99).to_s
  amount = first_four + "." + last_two

  Post.create(
    user: user_1,
    avatar: fixture_file_upload(File.join(Rails.root,"spec","fixtures", "binaries","cars","#{iteration}.jpg"),'image/jpg', "true"),
    title: "My Truck",
    price: amount,
    content: "F150 Ford, Moving must sell",
    community_ids:[community_1.id],
    photos_attributes:[ { pic: fixture_file_upload(File.join(Rails.root,"spec","fixtures", "binaries","cars","#{iteration}.jpg"),'image/jpg', "true")},{ pic: fixture_file_upload(File.join(Rails.root,"spec","fixtures", "binaries","cars","#{rand(1..20)}.jpg"),'image/jpg', "true")} ]
  )
end
for iteration in 11..15
  first_four = rand(5000).to_s
  last_two = rand(99).to_s
  amount = first_four + "." + last_two

  Post.create(
    user: user_2,
    avatar: fixture_file_upload(File.join(Rails.root,"spec","fixtures", "binaries","cars","#{iteration}.jpg"),'image/jpg', "true"),
    title: "My Truck",
    price: amount,
    content: "F150 Ford, Moving must sell",
    community_ids:[community_1.id],
    photos_attributes:[ { pic: fixture_file_upload(File.join(Rails.root,"spec","fixtures", "binaries","cars","#{iteration}.jpg"),'image/jpg', "true")},{ pic: fixture_file_upload(File.join(Rails.root,"spec","fixtures", "binaries","cars","#{rand(1..20)}.jpg"),'image/jpg', "true")} ]
  )
end
for iteration in 16..20
  first_four = rand(5000).to_s
  last_two = rand(99).to_s
  amount = first_four + "." + last_two

  Post.create(
    user: user_3,
    avatar: fixture_file_upload(File.join(Rails.root,"spec","fixtures", "binaries","cars","#{iteration}.jpg"),'image/jpg', "true"),
    title: "My Truck",
    price: amount,
    content: "F150 Ford, Moving must sell",
    community_ids:[community_1.id],
    photos_attributes:[ { pic: fixture_file_upload(File.join(Rails.root,"spec","fixtures", "binaries","cars","#{iteration}.jpg"),'image/jpg', "true")},{ pic: fixture_file_upload(File.join(Rails.root,"spec","fixtures", "binaries","cars","#{rand(1..20)}.jpg"),'image/jpg', "true")} ]
  )
end
