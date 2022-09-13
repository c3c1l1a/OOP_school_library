require_relative './rental'

class RentalUI < UI
  def prompt(books, people)
    return puts 'Create books and people first' if books.length.zero? || people.length.zero?

    person_option = person_prompt(people)
    return unless (0..people.length).to_a.include? person_option

    book_option = book_prompt(books)
    return unless (0..books.length).to_a.include? book_option

    date = get_input(['Date: '])

    Rental.new(date, books[book_option], people[person_option])
  end

  private

  def person_prompt(people)
    p 'Select a person from the following list by number'
    person_questions = people.map.with_index do |person, i|
      "#{i}) [#{person.class}] Name: #{person.name}, ID: #{person.id}, Age: #{person.age}\n"
    end
    get_input(person_questions).to_i
  end

  def book_prompt(books)
    p 'Select a book from the following list by number'
    book_questions = books.map.with_index do |book, i|
      "#{i}) [#{book.class}] Title: #{book.title}, Author: #{book.author}\n"
    end
    get_input(book_questions).to_i
  end
end
