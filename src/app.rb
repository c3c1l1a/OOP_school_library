require_relative './student_ui'
require_relative './teacher_ui'
require_relative './rental_ui'
require_relative './book_ui'

class App < UI
  def initialize
    super()
    @people = []
    @books = []
    @rentals = []
  end

  def list_people
    if @people.length.zero?
      p 'No people Yet'
      return
    end
    @people.each { |person| p "[#{person.class}] Name: #{person.name}, ID: #{person.id}, Age: #{person.age}" }
  end

  def create_person
    @option = get_input(['Do you want to create a student (1) or a teacher (2)? [Input then number]: ']).to_i
    case @option
    when 1
      student_ui = StudentUI.new
      student = student_ui.prompt
      @people << student

    when 2
      teacher_ui = TeacherUI.new
      teacher = teacher_ui.prompt
      @people << teacher
    end

    p 'Person create sucessfully!'
  end

  def create_rental
    rental_ui = RentalUI.new
    rental = rental_ui.prompt(@books, @people)
    @rentals << rental
    p 'Rental created sucessfully!'
  end

  def list_rentals
    person_id = get_input(['ID of person: ']).to_i
    person = @people.select { |item| item.id == person_id }
    return unless person.length.positive?

    p "This person hasn't rented a book" if person[0].rentals.length.zero?
    p 'Rentals: '
    person[0].rentals.each do |rental|
      p "Date: #{rental.date}, Book: '#{rental.book.title}', By: #{rental.book.author}"
    end
  end

  def create_book
    book_ui = BookUI.new
    book = book_ui.prompt
    @books << book
    p 'Book create sucessfully!'
  end

  def list_books
    if @books.length.zero?
      p 'No Books added Yet'
      return
    end
    @books.each { |book| p "Title: #{book.title}, Author: #{book.author}" }
  end
end
