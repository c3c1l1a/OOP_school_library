require_relative './teacher'

class TeacherUI < UI
  def prompt
    age = get_input(['Age: ']).to_i
    name = get_input(['Name: '])
    specialization = get_input(['Specialization: '])
    Teacher.new(age, name, specialization)
  end 
end