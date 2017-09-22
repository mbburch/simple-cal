# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

pwd = "password"
user1 = User.create!(email: "thefirst@example.com", first_name: "Jane", last_name: "Jenkins", password: pwd, password_confirmation: pwd)
user2 = User.create!(email: "thesecond@example.com", first_name: "Bob", last_name: "Wendoo", password: pwd, password_confirmation: pwd)
event1 = user1.events.create(title: Faker::Hipster.word,
                             description: Faker::Hipster.sentence,
                             start_time: DateTime.now,
                             end_time: DateTime.now + rand(2).days + rand(24).hours + (rand(2) * 30).minute
                            )

#  id          :integer          not null, primary key
#  title       :string
#  description :text
#  start_date  :datetime
#  end_date    :datetime
#  start_time  :time
#  end_time    :time
#  active      :boolean          default(TRUE)
#  private     :boolean          default(TRUE)
#  user_id     :integer
#  created_at  :datetime         not null
#  updated_at  :datetime         not null