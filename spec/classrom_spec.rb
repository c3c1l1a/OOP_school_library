require 'spec_helper'
require_relative '../src/classroom'

describe Classroom do
  classroom1 = Classroom.new('Biology')

  describe 'test instance' do
    it 'instance' do
      expect(classroom1.class).to be Classroom
    end
  end

  describe 'test label' do
    it 'Label' do
      expect(classroom1.label).to eql 'Biology'
    end
  end

  describe 'Test students array' do
    it 'arrsy of students in aclass' do
      expect(classroom1.students).to be_kind_of Array
    end
  end


end