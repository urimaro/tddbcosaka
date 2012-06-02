class Jihanki
  def initialize
    @total = 0
    @otsuri = 0
  end

  attr_accessor :total, :otsuri
  
  def input(input_money)
    case input_money
    when 1, 5, 2000, 5000, 10000
      @otsuri += input_money
    when 10, 50 ,100, 500, 1000
      @total += input_money
    end
  end

  def harai_modoshi
    @otsuri = @total
    @total = 0
    @otsuri
  end
end