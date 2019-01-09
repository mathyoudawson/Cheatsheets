User.create!(name:  "Example User",
             email: "example@test.com",
             password:              "foobar",
             password_confirmation: "foobar",
             admin: true,
             activated: true,
             activated_at: Time.zone.now)

99.times do |n|
  name  = Faker::Name.name
  email = "example-#{n+1}@railstutorial.org"
  password = "password"
   user = User.create!(name:  name,
               email: email,
               password:              password,
               password_confirmation: password,
               activated: true,
               activated_at: Time.zone.now)

  title = Faker::ProgrammingLanguage.name
  description = Faker::Fallout.quote
  cheatsheet = user.cheatsheets.create(title: title,
                         description: description)
  5.times do
    category = Faker::Science.element
    20.times do
      cheatsheet.cheats.create(category: category,
                              term: Faker::Science.element_symbol,
                              description: Faker::Science.scientist)
    end 
  end
end
