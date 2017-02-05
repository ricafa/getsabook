# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
puts "inserting students"
students = []
10.times do |n|
  students[n] = {name: "Aluno#{n}", email: "teste#{n}@gmail.com"}
end
Student.create(students)

puts "inserting books"
books  = []
10.times do |n|
  books[n] = {name: "Livro#{n}", author: "Machado #{n}"}
end
Book.create(books)
puts "inserting rents"
rents = []
1.upto(9) do |n|
  rents[n] = {student_id: n.to_i, book_id: n.to_i, bring_back: (Date.today+7)}
end
Rent.create(rents)
if Rent.count > 1
  puts "Success!"
else
  puts "sorry, we need to talk.."
end
