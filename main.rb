#!/usr/bin/env ruby
require_relative './app'

def show_options
	puts "\nPlease choose an option by entering a number"
	p "1 - List of all books"
	p "2 - List of all people"
	p "3 - Create a person"
	p "4 - Create a book"
	p "5 - Create a rental"
	p "6 - List all rentals for a given person id"
	p "7 - Exit"
end 

def create_person(option, app)
	person_promp = {
		:age => (print("Age: "); gets.chomp.to_i),
		:name => ((print("Name: "); gets.chomp))
	}
	if (option == 1)
		person_promp[:permission] = (print("Has parent permission? [Y/N]: "); gets.chomp)
		app.create_person('student', person_promp)
	else 
		person_promp[:specialization] = (print("Specialization: "); gets.chomp)
		app.create_person('teacher', person_promp)
	end
	p 'Person created successfully'
end

def create_book(app)
	book_promp = {
		:title => (print("Title: "); gets.chomp),
		:author => (print("Author: "); gets.chomp)
	}
	app.create_book(book_promp)
	p "Book created successfully"
end
def process_option(option, app)
	case option
	when 1
		app.list_books
	when 2
		app.list_people
	when 3
		print 'Do you want to create a student (1) or a teacher (2)? [Input then number]: '
		create_person(gets.chomp.to_i, app)
	when 4
		create_book(app)
	end

end

def main
	p "Welcome to School Library App"
	puts "\n"

	app = App.new
	loop do 	
		show_options
		option = gets.chomp.to_i	
		process_option(option, app)
		break if (option == 7)
	end

end

main