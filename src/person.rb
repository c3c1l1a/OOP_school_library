require_relative './nameable.rb'
require_relative './capitalize_decorator.rb'
require_relative './trimmer_decorator.rb'

class Person < Nameable 
  attr_accessor :name, :age
  attr_reader :id

  def initialize(age, name = 'Unknown', parental_permission: true)
    @id = 0
    @name = name
    @age = age
    @parental_permission = parental_permission
  end

  def can_use_service?
    of_age? || @parental_permission
  end

  def correct_name
    @name
  end

  private

  def of_age?
    @age >= 18
  end
end


person = Person.new(22, 'maximilianus')
p person.correct_name
capitalizedPerson = CapitalizeDecorator.new(person)
p capitalizedPerson.correct_name
capitalizedTrimmedPerson = TrimmerDecorator.new(capitalizedPerson)
p capitalizedTrimmedPerson.correct_name
