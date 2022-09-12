def create_person(app)
  p 'Do you want to create a student (1) or a teacher (2)? [Input then number]: '
  option = gets.chomp.to_i
  person_promp = {
    age: (print('Age: ')
          gets.chomp.to_i),
    name: (print('Name: ')
           gets.chomp)
  }
  case option
  when 1
    person_promp[:permission] = (print('Has parent permission? [Y/N]: ')
                                 gets.chomp)
    app.create_person('student', person_promp)
  when 2
    person_promp[:specialization] = (print('Specialization: ')
                                     gets.chomp)
    app.create_person('teacher', person_promp)
  else return
  end
  p 'Person created successfully'
end

def create_book(app)
  book_promp = {
    title: (print('Title: ')
            gets.chomp),
    author: (print('Author: ')
             gets.chomp)
  }
  app.create_book(book_promp)
  p 'Book created successfully'
end

def create_rental(app)
  if app.books.length.zero? || app.people.length.zero?
    p 'Make sure to have at least one person and book'
    return
  end

  p 'Select a book from the following list by number'
  app.list_books_with_numbers
  book_option = gets.chomp.to_i
  return unless (0..app.books.length).to_a.include? book_option

  puts "\n Select a person from the following list by number"
  app.list_people_with_numbers
  person_option = gets.chomp.to_i
  return unless (0..app.people.length).to_a.include? person_option

  rental_promp = {
    date: (print('Date: ')
           gets.chomp),
    book: book_option,
    person: person_option
  }
  app.create_rental(rental_promp)
  p 'Rental created successfully'
end

def list_rentals(app)
  person_id = (print('ID of person: ')
               gets.chomp.to_i)
  p 'Rentals: '
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