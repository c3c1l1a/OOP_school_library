class Rental
  attr_accessor :date
  attr_reader :book, :person

  def initialize(date, book, person)
    @date = date
    @book = book
    @person = person

    assign_book
    assign_person
  end

  def assign_book
    @book.rentals << self unless @book.rentals.include? self
  end

  def assign_person
    @person.rentals << self unless @person.rentals.include? self
  end
end
