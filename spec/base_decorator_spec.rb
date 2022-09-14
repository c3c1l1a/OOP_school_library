require_relative '../src/base_decorator'
require_relative 'spec_helper'

describe BaseDecorator do
	class FakeNameable 
		def correct_name
    	raise NotImplementedError
  	end
	end

	describe '#correct_name' do
		it 'raises a NotImplementedError' do
			nameable = FakeNameable.new
			base_decorator = BaseDecorator.new(nameable)
			expect { base_decorator.correct_name }.to raise_error(NotImplementedError)
		end
	end
end