require_relative './base_decorator.rb'

class CapitalizeDecorator < BaseDecorator
	def initalize(nameable)
		@nameable = nameable
	end

	def correct_name 
		plain_name = @nameable.correct_name 
		capitalized = plain_name.capitalize
	end
end