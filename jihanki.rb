class Jihanki
  def initialize
    @input_money = 0
    @otsuri = 0
  end

  def display
    @input_money
  end
  
  def input(money)
    case money
    when 1, 5, 2000, 5000, 10000
      @otsuri += money
    when 10, 50 ,100, 500, 1000
      @input_money += money
    end
  end

  def getOtsuri
    @otsuri
  end
end