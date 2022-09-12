require_relative './student'
require_relative './teacher'

class CreatePerson
  def initialize
    @age = 0
    @name =  ''
    @permission = ''
    @specialization = ''
  end

  def create_student
    puts
    @age = get_input('Age: ').to_i
    @name =get_input('Name: ')
    @permission =get_input('Permission: ')
    case @permission
    when 'Y'
      @permission = true
    when 'N'
      @permission = false
    end
    puts "Student created successfully"
    Student.new(@age, @name, @permission)
  end

  def create_teacher
    puts
    @age = get_input('Age: ').to_i
    @name = get_input('Name: ')
    @specialization = get_input('Specialization: ')
    puts "Teacher created successfully"
    Teacher.new(@age, @name, @specialization)
  end

  private

  def get_input(question)
    print question
    gets.chomp
  end

end