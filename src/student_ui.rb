require_relative './student'

class StudentUI < UI 
  def prompt
    age = get_input(['Age: ']).to_i
    name = get_input(['Name: '])
    option = get_input(['Permission [Y/N]: '])

    permission = false unless option.upcase === 'Y'

    Student.new(age, name, permission) 
  end
end