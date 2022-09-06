require_relative './base_decorator'

class TrimmerDecorator < BaseDecorator
  def correct_name
    plain_name = @nameable.correct_name
    plain_name[0...10]
  end
end
