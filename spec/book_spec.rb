require_relative '../src/book'
require_relative 'spec_helper'

describe Book do

  describe "#new" do
    let (:book) { Book.new('Game of thrones', 'G. Martin') }

    it "checks if the book title is correct" do
      expect(book.title).to eql 'Game of thrones'
    end

    it "checks if book author is correct" do
      expect(book.author).to eql 'G. Martin'
    end  
  end

  describe '#add_rental' do
    class FakeRental
      attr_reader :book
      def initialize(date, book, person)
        @date = date
        @book = book
        @person = person
      end
    end

    let (:book) {Book.new('Ruby', 'Mark')}
    

    describe '#add_renter' do
      before (:each) do
        @rental = FakeRental.new('2020/02/02', book, 'person')
        book.add_renter(@rental)
      end

      it 'add a single rental' do
        expect(book.rentals.length).to eql 1
      end 

      it 'book has a rental' do
        expect(book.rentals[0]).to equal @rental
      end

      it 'rental has a book' do
        expect(book).to equal @rental.book
      end
    end
  end 
end