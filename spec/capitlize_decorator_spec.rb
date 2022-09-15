require_relative '../src/capitalize_decorator'
require_relative 'spec_helper'

class FakePerson
  attr_accessor :title, :author, :rentals, :name

  def initialize(age, name = 'Unknown', parental_permission: true)
    @id = Random.rand(0...100)
    @name = name
    @age = age
    @parental_permission = parental_permission
    @rentals = []
  end

  def correct_name
    @name
  end
end

describe CapitalizeDecorator do
  describe '#correct_name' do
    before(:each) do
      @person = FakePerson.new(10, 'ruby', parental_permission: false)
      @name = @person.name
      @capitalized = CapitalizeDecorator.new(@person)
    end
    it 'capilizes the name' do
      expect { @name = @capitalized.correct_name }.to change { @name }.from('ruby').to('Ruby')
    end
  end
end
