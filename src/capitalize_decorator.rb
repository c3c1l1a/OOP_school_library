require_relative './base_decorator'

class CapitalizeDecorator < BaseDecorator
  def correct_name
    plain_name = @nameable.correct_name
    plain_name.capitalize
  end
end
