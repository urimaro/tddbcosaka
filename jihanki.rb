class Jihanki
  def display
    @input_money ||= 0
  end
  
  def input(money)
    case money
    when 1, 5, 2000, 5000, 10000
    when 10, 50 ,100, 500, 1000
      @input_money = money
    end
  end
end