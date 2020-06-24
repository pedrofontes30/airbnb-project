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
User.destroy_all
Sport.destroy_all

user1 = User.create(email: 'nunoteacher@gmail.com', password: '123456', first_name: 'Nuno', last_name: 'Lei', age: 26, role: 'teacher')
user2 = User.create(email: 'pedrostudent@gmail.com', password: '123456', first_name: 'Pedro', last_name: 'Fontes', age: 17, role: 'student')
user3 = User.create(email: 'rezstudent@gmail.com', password: '123456', first_name: 'Rez', last_name: 'Iqbal', age: 27, role: 'student')
user4 = User.create(email: 'camilastudent@gmail.com', password: '123456', first_name: 'Camila', last_name: 'Silva', age: 25, role: 'student')

surf = Sport.create(name: 'surf')
skate = Sport.create(name: 'skate')
yoga = Sport.create(name: 'yoga')

lesson = Lesson.create( description: "Lesson for any beginners who want to have fun and learn the basics of surfing!",
               start_time: "9",
               end_time: "11",
               week_day: "saturday",
               location: "Caparica",
               max_attendees: 5,
               user: user1,
               price: 50,
               sport_id: surf.id)

Appointment.create(user: user2, lesson: lesson)

Review.create(content: 'Lots of fun in my first day of surfing!', rating: 5, lesson_id: lesson.id, user: user2)

