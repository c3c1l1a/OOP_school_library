require_relative '../app'

class create_person
  def initialize(app)
    @app = app
    @age = 0
    @name =  ''
    @permission = ''
    @specialization = ''
  end

  def create_student
    puts
    @age = get_input.to_i
    @name =get_input
    @permission =get_input
    case permission
    when 'Y'
      @permission = true
    when 'N'
      @permission = false
    end
    @app.create_person('student', {:age => @age, :name => @name, :permission => @permission})
    "Student created successfully"
  end

  def create_teacher
    puts
    @age = get_input.to_i
    @name = get_input
    @specialization = get_input
    @app.create_person('teacher', {:age => @age, :name => @name, :specialization => @specialization})
    "Teacher created successfully"
  end

  private
  def get_input(question)
    print question
    gets.chomp
  end

end