#!/usr/bin/env ruby
require_relative './app'

class Main
  def initialize
    @app = App.new 
    @options = ''
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
      #process_option(option, app)
      break if option == 7
    end
  end
end


main = Main.new 
main.start