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

def create_person(app)
	print 'Do you want to create a student (1) or a teacher (2)? [Input then number]: '
	option = gets.chomp.to_i

	person_promp = {
		:age => (print("Age: "); gets.chomp.to_i),
		:name => ((print("Name: "); gets.chomp))
	}
	if (option == 1)
		person_promp[:permission] = (print("Has parent permission? [Y/N]: "); gets.chomp)
		app.create_person('student', person_promp)
	elsif (option == 2)
		person_promp[:specialization] = (print("Specialization: "); gets.chomp)
		app.create_person('teacher', person_promp)
	else 
		p 'Invalid Option'
		return
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

def create_rental(app)
	if (app.books.length == 0 || app.people.length == 0)
		p "Make sure to have at least one person and book"
		return
	end

	p "Select a book from the following list by number"
	app.list_books_with_numbers
	book_option = gets.chomp.to_i
	if (!(0..app.books.length).to_a.include? book_option)
		p "Invalid Option"
		return
	end

	puts "\n Select a person from the following list by number"
	app.list_people_with_numbers
	person_option = gets.chomp.to_i
	if (!(0..app.people.length).to_a.include? person_option)
		p "Invalid Option"
		return
	end

	puts "\n"

	rental_promp = {
		:date => (print("Date: "); gets.chomp),
		:book => book_option,
		:person => person_option
	}
	app.create_rental(rental_promp)
	p "Rental created successfully"
end

def list_rentals(app)
	person_id = (print("ID of person: "); gets.chomp.to_i)
	p "Rentals: "
	app.list_rentals(person_id)
end

def process_option(option, app)
	case option
	when 1
		app.list_books
	when 2
		app.list_people
	when 3
		create_person(app)
	when 4
		create_book(app)
	when 5
		create_rental(app)
	when 6
		list_rentals(app)
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