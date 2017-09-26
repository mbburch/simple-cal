pwd = "password"

# Users
user1 = User.create(email: "jjenkins@example.com", first_name: "Jane", last_name: "Jenkins", password: pwd, password_confirmation: pwd)
user2 = User.create(email: "bobbyg@example.com", first_name: "Bob", last_name: "Wendoo", password: pwd, password_confirmation: pwd)
# Categories
exercise = user1.categories.create(name: "Exercise", color: Faker::Color.hex_color)
family = user1.categories.create(name: "Family", color: Faker::Color.hex_color)
work = user2.categories.create(name: "Work", color: Faker::Color.hex_color)
personal = user2.categories.create(name: "Personal", color: Faker::Color.hex_color)
# Events
event1 = user1.events.create(title: Faker::Hipster.word,
                             description: Faker::Hipster.sentence,
                             start_time: Time.zone.now,
                             end_time: Time.zone.now + rand(2).days + rand(24).hours + (rand(2) * 30).minute,
                             category_id: exercise.id)
event2 = user1.events.create(title: Faker::Hipster.word,
                             description: Faker::Hipster.sentence,
                             start_time: Time.zone.now,
                             end_time: Time.zone.now + rand(2).days + rand(24).hours + (rand(2) * 30).minute,
                             category_id: family.id)
event3 = user1.events.create(title: Faker::Hipster.word,
                             description: Faker::Hipster.sentence,
                             start_time: Time.zone.now,
                             end_time: Time.zone.now + rand(2).days + rand(24).hours + (rand(2) * 30).minute,
                             category_id: exercise.id)
event4 = user2.events.create(title: Faker::Hipster.word,
                           description: Faker::Hipster.sentence,
                           start_time: Time.zone.now,
                           end_time: Time.zone.now + rand(2).days + rand(24).hours + (rand(2) * 30).minute,
                           category_id: work.id)
event5 = user2.events.create(title: Faker::Hipster.word,
                           description: Faker::Hipster.sentence,
                           start_time: Time.zone.now,
                           end_time: Time.zone.now + rand(2).days + rand(24).hours + (rand(2) * 30).minute,
                           category_id: personal.id)
# Comments
comment1 = event1.comments.create(comment: Faker::Hipster.sentence)
comment2 = event2.comments.create(comment: Faker::Hipster.sentence)
comment3 = event3.comments.create(comment: Faker::Hipster.sentence)
comment4 = event4.comments.create(comment: Faker::Hipster.sentence)
comment5 = event5.comments.create(comment: Faker::Hipster.sentence)
comment6 = event1.comments.create(comment: Faker::Hipster.sentence)
comment7 = event2.comments.create(comment: Faker::Hipster.sentence)
comment8 = event3.comments.create(comment: Faker::Hipster.sentence)
# Tasks
task1 = event1.tasks.create(description: Faker::Hipster.sentence, priority: Task.priorities.values.sample)
task2 = event1.tasks.create(description: Faker::Hipster.sentence, priority: Task.priorities.values.sample)
task3 = event2.tasks.create(description: Faker::Hipster.sentence, priority: Task.priorities.values.sample)
task4 = event2.tasks.create(description: Faker::Hipster.sentence, priority: Task.priorities.values.sample)
task5 = event3.tasks.create(description: Faker::Hipster.sentence, priority: Task.priorities.values.sample)
task6 = event3.tasks.create(description: Faker::Hipster.sentence, priority: Task.priorities.values.sample)
task7 = event4.tasks.create(description: Faker::Hipster.sentence, priority: Task.priorities.values.sample)
task8 = event4.tasks.create(description: Faker::Hipster.sentence, priority: Task.priorities.values.sample)
task9 = event5.tasks.create(description: Faker::Hipster.sentence, priority: Task.priorities.values.sample)
task10 = event5.tasks.create(description: Faker::Hipster.sentence, priority: Task.priorities.values.sample)

