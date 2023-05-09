User.destroy_all
Recipe.destroy_all 

User.create(username: "Min", password: "Min123", image_url: "www.min.com", bio: "Min is a R.Ph")
User.create(username: "Moy", password: "Moy123", image_url: "www.moy.com", bio: "Moy is a NP")
User.create(username: "Jess", password: "Jess123", image_url: "www.jess.com", bio: "Jess is an Account Executive")

30.times{Recipe.create()}

Recipe.create(title: "T1", instructions: "I1", minutes_to_complete: 30, user: User.all.sample)

