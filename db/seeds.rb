# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)


User.create(email: "user@gmail.com", password: "123456")

10.times do
Lesson.create(description: "Lesson for any beginners who want to have fun and learn the basics of surfing!", start_time: "9", end_time: "11", week_day: "saturday", location: "Caparica", user_id: User.first.id, max_attendees: 5)
end


