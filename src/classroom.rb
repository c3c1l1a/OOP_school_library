require_relative './student'

class Classroom
	attr_accessor :label, :students
	def initialize(label)
		@label = label
		@students = []
	end

	def add_student(student)
		@students << student
	end
end


# Add Student to class
p "Add Student to class"
p '======================================='
classroom_a = Classroom.new('Classroom A')
kate = Student.new(10, 'Kate', false, classroom_a)
camila = Student.new(13, 'Camila', true, classroom_a)
classroom_a.add_student(kate)
classroom_a.add_student(camila)
pp classroom_a.students


p '======================================='
p '======================================='
p "Assign/set class for student"
 
wayan = Student.new(12, 'Wayan', true, classroom_a)
wayan.asign_classroom()

pp classroom_a.students
