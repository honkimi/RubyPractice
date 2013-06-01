require './sudoku/form'

class Frame 
  attr_accessor :right, :below
  attr_reader :value

  # cell の9個の配列
  def initialize(cells)
    @form = Form.new(cells)
    @value = self
  end

  def method_missing(action, *args)
    @form.send(action, *args)
  end
end
