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

def process_person(option, app)
	person_promp = {
		:age => (print("Age: "); gets.chomp.to_i),
		:name => ((print("Name: "); gets.chomp))
	}
	if (option == 1)
		person_promp[:permission] = (print("Has parent permission? [Y/N]: "); gets.chomp)
		app.add_person('student', person_promp)
	else 
		person_promp[:specialization] = (print("Specialization: "); gets.chomp)
		app.add_person('teacher', person_promp)
	end
end

def process_option(option, app)
	
	case option
	when 1
		p '1'
	when 2
		p '2'
	when 3
		print 'Do you want to create a student (1) or a teacher (2)? [Input then number]: '
		process_person(gets.chomp.to_i, app)
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