#!/usr/bin/env ruby
require_relative './app'
require_relative './src/create_person'

class Main
  def initialize(app)
    @app = app 
    @options = ''
  end 

  def process_option
    case @option
    when 1
      #@app.list_books
    when 2
      #@app.list_people
    when 3
      @app.create_person
    when 4
      #create_book(app)
    when 5
      #create_rental(app)
    when 6
      #list_rentals(app)
    end
  end

  def show_options
    puts "\nPlease choose an option by entering a number"
    p '1 - List of all books'
    p '2 - List of all people'
    p '3 - Create a person'
    p '4 - Create a book'
    p '5 - Create a rental'
    p '6 - List all rentals for a given person id'
    p '7 - Exit'
  end

  def start
    p 'Welcome to School Library App'
    puts "\n"

    loop do
      show_options
      @option = gets.chomp.to_i
      process_option
      break if @option == 7
    end
  end
end


main = Main.new(App.new) 
main.start