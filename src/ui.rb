class UI
  def get_input(questions=[])
    questions.each { |question| print question }
    gets.chomp
  end
end 