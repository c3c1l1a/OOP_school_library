require_relative '../src/rental'
require_relative 'spec_helper'

describe Rental do
	class FakeBook
		attr_accessor :title, :author, :rentals
		def initialize(title, author)
			@title = title
			@author = author
			@rentals = []
		end
	end

	class FakePerson
		attr_accessor :title, :author, :rentals
		def initialize(age, name = 'Unknown', parental_permission: true)
			@id = Random.rand(0...100)
			@name = name
			@age = age
			@parental_permission = parental_permission
			@rentals = []
		end
	end

	describe '#new' do
		before(:each) do
			@book = FakeBook.new('Game of thrones', 'G. Martin')
			@person = FakePerson.new(10, 'Ruby', parental_permission:false)
			@rental = Rental.new('2020/03/01', @book, @person )
		end

		it 'test self' do
			expect(@rental.class).to be(Rental)
		end 

		it 'checks reference of rental in book' do
			expect(@book.rentals[0]).to equal @rental
		end

		it 'checks reference of rental in person' do
			expect(@person.rentals[0]).to equal @rental
		end

		it 'checks reference of rental in book and person is the same' do
			expect(@person.rentals[0]).to equal @book.rentals[0]
		end
	end
end

