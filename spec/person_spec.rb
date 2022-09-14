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



end