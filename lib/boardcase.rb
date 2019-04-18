#notre tableau est défini dans le board.rb avec la méthode update_board

class BoardCase

  attr_reader :case_name

  def initialize(case_name)
    @case_name = case_name
  end

end
