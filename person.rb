class Person
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

  private

  def of_age?
    @age >= 18
  end
end
