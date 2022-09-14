require_relative './base_decorator'

class CapitalizeDecorator < BaseDecorator
  attr_accessor :nameable
  def initialize(nameable)
    @nameable = nameable
  end
  def correct_name
    plain_name = @nameable.correct_name
    plain_name.capitalize
  end
end
