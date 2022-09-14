require_relative 'spec_helper'
require_relative '../src/teacher'

describe Teacher do
  teacher1 = Teacher.new(44, 'Ligawa', 'Chem')

  describe 'Test instance' do
    it 'instance' do
      expect(teacher1.class).to be Teacher
    end
  end

  describe 'Test age > 40' do
    it 'age > 40' do
      expect(teacher1.age).to be > 40
    end
  end

  describe 'test name' do
    it 'name has a method upcase' do
      expect(teacher1.name).to respond_to(:upcase)
    end
  end

  describe 'can use service' do
    it 'Can a teacher use a service' do
      expect(teacher1.can_use_service?).to be true
    end
  end
end
