# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
require "open-uri"

Review.destroy_all
Appointment.destroy_all
Lesson.destroy_all
User.destroy_all
Sport.destroy_all

user1 = User.create(email: 'nunoteacher@gmail.com', password: '123456', first_name: 'Nuno', last_name: 'Lei', age: 26, role: 'Teacher')
user2 = User.create(email: 'pedrostudent@gmail.com', password: '123456', first_name: 'Pedro', last_name: 'Fontes', age: 17, role: 'Student')
user3 = User.create(email: 'rezstudent@gmail.com', password: '123456', first_name: 'Rez', last_name: 'Iqbal', age: 27, role: 'Student')
user4 = User.create(email: 'camilastudent@gmail.com', password: '123456', first_name: 'Camila', last_name: 'Silva', age: 25, role: 'Student')
user5 = User.create(email: 'mickteacher@gmail.com', password: '123456', first_name: 'Mick', last_name: 'Fanning', age: 29, role: 'Teacher')
user6 = User.create(email: 'paulateacher@gmail.com', password: '123456', first_name: 'Paula', last_name: 'Gomes', age: 26, role: 'Teacher')

photos = ["https://lifewithoutandy.com/wp-content/uploads/2020/05/IMG_1514.jpg", "https://images.squarespace-cdn.com/content/v1/59b50ba92994caee6be44de7/1537687213972-4820VG7ZA2V63NTREUME/ke17ZwdGBToddI8pDm48kMFiMyT1nneRMhnmfuSfpxZ7gQa3H78H3Y0txjaiv_0fDoOvxcdMmMKkDsyUqMSsMWxHk725yiiHCCLfrh8O1z4YTzHvnKhyp6Da-NYroOW3ZGjoBKy3azqku80C789l0mlM0or4nqX7jrn5yWu0hA1QXedaIFqnAbw_tQShHbKg4-O_KAc44ak5jGzrnn7f3A/concretegirlsprom-7982.jpg", "https://images.unsplash.com/photo-1545205597-3d9d02c29597?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=1500&q=80"]

surf = Sport.create(name: 'surf', description: 'Have fun surfing with a certified instructor.', photo: photos[0])
skate = Sport.create(name: 'skate', description: 'Learn to skate today with a certified instructor.', photo: photos[1])
yoga = Sport.create(name: 'yoga', description: 'Regular practice creates mental clarity and calmness.', photo: [2])

lesson1 = Lesson.create( description: "Lesson for any beginners who want to have fun and learn the basics of surfing!",
               start_time: "9",
               end_time: "11",
               week_day: "saturday",
               location: "Caparica",
               max_attendees: 5,
               user: user5,
               price: 60,
               sport_id: surf.id,
               address: 'Rua Praia da Saúde 2825-412 Costa da Caparica',
               difficulty: 'Beginner')

file = URI.open('https://kiteschoolportugal.com/wp-content/uploads/2017/02/surf-lessons-1-of-2.jpg')
lesson1.photo.attach(io: file, filename: 'surf_lesson_4.png', content_type: 'image/jpg')

lesson2 = Lesson.create( description: "Lesson for any beginners who want to have fun and learn the basics of skateboarding!",
               start_time: "16",
               end_time: "18",
               week_day: "friday",
               location: "Ericeira",
               max_attendees: 3,
               user: user1,
               price: 40,
               sport_id: skate.id,
               address: 'Estrada Nacional 247, 2655-319 Ericeira',
               difficulty: 'Intermediate')

file = URI.open('https://www.baysixty6.com/wp-content/uploads/2016/03/Beginner-Sessions-Group-Lessons-BAYSIXTY6-Skate-Park-LEARN-TO-SKATEBOARD.jpg')
lesson2.photo.attach(io: file, filename: 'skate_lesson_2.png', content_type: 'image/jpg')

lesson3 = Lesson.create( description: "Uhhuuuul! Let's go surfing!",
               start_time: "8",
               end_time: "10",
               week_day: "sunday",
               location: "Carcavelos",
               max_attendees: 4,
               user: user1,
               price: 50,
               sport_id: surf.id,
               address: 'Avenida Marginal, 2775-604 Carcavelos',
               difficulty: 'Advanced')

file = URI.open('https://scontent.flis8-2.fna.fbcdn.net/v/t1.0-9/69512086_2464681983598942_8273203903793725440_o.jpg?_nc_cat=101&_nc_sid=e007fa&_nc_ohc=kpUEKAVZ1hcAX_7IL6Q&_nc_ht=scontent.flis8-2.fna&oh=f96db1d161aff8771343fdc9f4eb8eab&oe=5F1C1CE8')
lesson3.photo.attach(io: file, filename: 'surf_lesson_5.jpg', content_type: 'image/jpg')

lesson4 = Lesson.create( description: "Advanced yoga positions and meditation session...",
               start_time: "18",
               end_time: "19",
               week_day: "tuesday",
               location: "Cascais",
               max_attendees: 6,
               user: user6,
               price: 60,
               sport_id: yoga.id,
               address: 'Rua dos Faisões, Vila Bicuda, 2750-689 Cascais',
               difficulty: 'Beginner')

file = URI.open('https://www.smaac-amalficoast.com/rentals/fotos/2/15101297614f874ca2dd08bead678bbe0f90752f13/1510129761e66d41688860000f28c66e60a02b0557.jpg')
lesson4.photo.attach(io: file, filename: 'yoga_lesson_2', content_type: 'image/jpg')

# Appointment.create(user: user2, lesson: lesson)

# Review.create(content: 'Lots of fun in my first day of surfing!', rating: 5, lesson_id: lesson.id, user: user2)
