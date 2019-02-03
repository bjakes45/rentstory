# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

def seed_topics

	topics = [
		{name: "Landlord Harassment", desc: ""},
		{name: "Illegal Eviction", desc: ""},
		{name: "Outstanding Maintenance", desc: ""},
		{name: "Pests", desc: ""},
		{name: "Other", desc: ""}
	]

	Topic.create(topics)
end

def seed_users
  
  User.create(
    email: "vtu.datatools@gmail.com",
    password: "123456",
  )

end

def seed_posts
  Post.create(
      topic_id: 5,
      user_id: 1,
      title: "Welcome to VTU - Renters' Stories",
      body: "Lorem Ipsum"
     )
end

def seed_admins
   
  Admin.create(
    user_id: 1,
    created_by: 1,
   )

end

def seed_reports
    
  Report.create(
    post_id: Post.all.sample(1).first.id,
    user_id: User.all.sample(1).first.id,

    topic: "Inappropriate Language",
    body: "Body"
   )

end

seed_topics
seed_users
seed_posts
seed_admins
seed_reports
