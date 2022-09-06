require_relative './base_decorator.rb'

class TrimmerDecorator < BaseDecorator
	def initalize(nameable)
		@nameable = nameable
	end

	def correct_name 
		plain_name = @nameable.correct_name 
		plain_name[0...10]
	end
end