require_relative 'spec_helper'
require_relative '../src/student'

describe Student do
  before :each do
    @student = Student.new 21, "Tilisi", true
  end

  describe 'Test instance' do
    it 'test instance' do
      @student.should be_an_instance_of Student
    end
  end

  describe 'Test age' do
    it 'Test age' do
      @student.age.should eql 21
    end
  end

  describe 'test name' do
    it 'test name' do
      @student.name.should be_an_instance_of String
    end
  end

end