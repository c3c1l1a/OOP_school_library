require 'spec_helper'
require_relative '../src/person'

describe Person do
  

  describe 'test self' do
    before(:each) do
      @person = Person.new(23, "Tilisi")
    end
    it 'test class' do
      expect(@person.class).to be(Person)
    end
  end

  describe 'test correct name' do
    before(:each) do
      @person = Person.new(23, "Tilisi")
    end

    it 'test name' do
      expect(@person.correct_name).to eq 'Tilisi'
    end
  end

  describe 'Age' do
    before(:each) do
      @person = Person.new(23, "Tilisi")
    end

    it 'Test if old enough' do
      expect(@person.can_use_service?).to eql true
    end
  end

  describe 'Can add rental' do 
    class FakeRental
      attr_reader :person
      def initialize(date, book, person)
        @date = date
        @book = book
        @person = person
      end
    end

    let (:person) {Person.new(10, 'Jerry', parental_permission:false)}

    describe '#add_rental' do
      before(:each) do
        @rental1 = FakeRental.new('2020/03/05', 'Game of thrones', person)
        @rental2 = FakeRental.new('2020/04/09', 'Midnight sun', person)
        person.add_rental(@rental1)
        person.add_rental(@rental2)
      end

      it 'checks a rental has been added' do
        expect(person.rentals.length).to eql 2
      end

      it 'tests rental person is instance of person' do
        expect(@rental1.person.class).to be(Person)
      end

      it 'tests rental and person relationship' do
        expect(person.rentals[0].person.name).to eql @rental1.person.name
      end

    end
  end

end