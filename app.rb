require_relative './src/student'
require_relative './src/classroom'
require_relative './src/rental'
require_relative './src/book'
require_relative './src/teacher'

class App
	attr_accessor :students
	
	def initialize
		@students = []
		@teachers = []
	end
	
	def add_person(type, info)
		if (type == 'student')
			@students << Student.new(info[:age], info[:name], info[:permission])
		else 
			@teachers << Teacher.new(info[:age], info[:name], info[:specialization])
		end
	end
end
















# literature_classroom = Classroom.new('Literature Classroom')
# p 'THERE ARE THREE STUDENTS IN LITERATURE CLASSROOM'
# kate = Student.new(10, 'Kate', false, literature_classroom)
# camila = Student.new(13, 'Camila', true, literature_classroom)
# wayan = Student.new(12, 'Wayan', true, literature_classroom)

# literature_classroom.students.each { |student| p student.name }

# puts "\n======================================\n"
# harry_porter = Book.new('Harry Potter', 'J. K. Rowling')
# midnight_sun = Book.new('Midnight Sun', 'Stephenie Meyer')

# p 'TWO PEOPLE ARE RENTING HARRY POTTER'
# Rental.new('2020-12-1', harry_porter, wayan)
# Rental.new('2021-05-16', harry_porter, camila)
# harry_porter.rentals.each { |rental| p "- #{rental.person.name} on #{rental.date}" }

# puts "\n"
# puts "\n"

# p 'TWO PEOPLE ARE RENTING MIDNIGHT SUN'
# Rental.new('2021-09-02', midnight_sun, wayan)
# Rental.new('2021-05-16', midnight_sun, kate)
# midnight_sun.rentals.each { |rental| p "- #{rental.person.name} on #{rental.date}" }

# puts "\n"
# puts "\n"

# p 'WAYAN IS RENTING TWO BOOKS'
# wayan.rentals.each { |rental| p "- #{rental.book.title} on #{rental.date}" }
