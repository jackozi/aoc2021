class Submarine
  attr_accessor :data

  def initialize(data:)
    @data = data
  end

  def transposed_data
    @data.split.map(&:chars).transpose
  end

  def gamma
    transposed_data.map {|bit| bit.count("1") > bit.count("0") ? "1" : "0" }.join.to_i(2)
  end

  def epsilon
    gamma ^ 0xfff
  end
end

submarine = Submarine.new(data: File.read('input.txt'))
puts submarine.gamma * submarine.epsilon
