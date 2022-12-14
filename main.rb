require_relative './src/ui'
require_relative './src/app'

class Main < UI
  def prompt
    puts "\nPlease choose an option by entering a number"
    questions = [
      "1 - List of all books\n",
      "2 - List of all people\n",
      "3 - Create a person\n",
      "4 - Create a book\n",
      "5 - Create a rental\n",
      "6 - List all rentals for a given person id\n",
      "7 - Exit\n\n"
    ]
    @option = get_input(questions).to_i
  end

  def run_app(app)
    case @option
    when 1
      app.list_books
    when 2
      app.list_people
    when 3
      app.create_person
    when 4
      app.create_book
    when 5
      app.create_rental
    when 6
      app.list_rentals
    end
  end

  def execute(app)
    puts "\nWelcome to School Library app"
    loop do
      prompt
      run_app(app)
      return puts "Thank you for using this app! \n" if @option == 7
    end
  end
end

main = Main.new
main.execute(App.new)
