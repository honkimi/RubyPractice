class Cell
  attr_accessor :right, :below, :choise, :exist
  attr_reader :value

  def initialize(value)
    if value
      @value = value 
      @exist = true
    else
      @exist = false
    end
  end

  def value=(v)
    @value = v
    @exist = true
  end

end

