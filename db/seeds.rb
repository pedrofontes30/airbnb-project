# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

Review.destroy_all
Lesson.destroy_all
Appointment.destroy_all

lesson = Lesson.create( description: "Lesson for any beginners who want to have fun and learn the basics of surfing!",
               start_time: "9",
               end_time: "11",
               week_day: "saturday",
               location: "Caparica",
               max_attendees: 5,
               user_id: 1)

Review.create(content: 'Lots of fun in my first day of surfing!', rating: 5, lesson_id: lesson.id, user_id: 1)
Review.create(content: 'Nuno is a great teacher!', rating: 4, lesson_id: lesson.id , user_id: 1)
