require_relative './book'

class BookUI < UI
  def prompt
    title = get_input(['Title: '])
    author = get_input(['Author: '])
    Book.new(title, author)
  end
end
