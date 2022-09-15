require_relative '../src/trimmer_decorator'
require_relative 'spec_helper'

describe TrimmerDecorator do

	class FakePerson
		attr_accessor :title, :author, :rentals, :name
		def initialize(age, name = 'Unknown', parental_permission: true)
			@id = Random.rand(0...100)
			@name = name
			@age = age
			@parental_permission = parental_permission
			@rentals = []
		end

		def correct_name
			@name
		end
	end

	describe '#correct_name' do
		before(:each) do
			@person = FakePerson.new(10, 'Ruby on rails', parental_permission:false)
			@name = @person.name
			@trimmed = TrimmerDecorator.new(@person)

		end
		it 'trims the name' do 
			expect { @name = @trimmed.correct_name }.to change { @name }.from('Ruby on rails').to('Ruby on ra')
		end
	end
end