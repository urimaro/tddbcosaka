class Jihanki
  def initialize
    @money = 0
    @otsuri = 0
  end

  def total
    @money
  end
  
  def input(input_money)
    case input_money
    when 1, 5, 2000, 5000, 10000
      @otsuri += input_money
    when 10, 50 ,100, 500, 1000
      @money += input_money
    end
  end

  def otsuri
    @otsuri
  end
end