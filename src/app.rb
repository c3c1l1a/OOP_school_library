require_relative './student_ui'
require_relative './teacher_ui'
require_relative './rental_ui'
require_relative './book_ui'

class App < UI
  def initialize
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
      studentUI = StudentUI.new
      student = studentUI.prompt
      @people << student

    when 2 
      teacherUI = TeacherUI.new
      teacher = teacherUI.prompt
      @people << teacher
    else return 
    end
  end 

  def create_rental
    rentalUI = RentalUI.new
    rental = rentalUI.prompt(@books, @people)
    @rentals << rental
  end 

  def list_rentals
    person_id = get_input(['ID of person: ']).to_i
    person = @people.select { |item| item.id == person_id }
    return unless person.length.positive?

    p "This person hasn't rented a book" if person[0].rentals.length.zero?
    person[0].rentals.each do |rental|
      p "Date: #{rental.date}, Book: '#{rental.book.title}', By: #{rental.book.author}"
    end
  end

  def create_book
    bookUI = BookUI.new
    book = bookUI.prompt
    @books << book
  end

  def list_books
    if @books.length.zero?
      p 'No Books added Yet'
      return
    end
    @books.each { |book| p "Title: #{book.title}, Author: #{book.author}" }
  end
end

