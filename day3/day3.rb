class Submarine
  attr_accessor :data

  def initialize(data:)
    @data = data.split.map(&:chars)
  end

  def gamma(data: @data)
    data.transpose.map {|bit| bit.count("1") >= bit.count("0") ? "1" : "0" }.join
  end

  def epsilon(data: @data)
    data.transpose.map {|bit| bit.count("1") < bit.count("0") ? "1" : "0" }.join
  end

  def oxygen
    data = @data.dup
    data.first.count.times do |i|
      gamma = gamma(data: data)
      data = data.filter {|entry| entry[i].eql?(gamma[i]) }
    end

    data.first.join.to_i(2)
  end

  def co2
    data = @data.dup
    data.first.count.times do |i|
      epsilon = epsilon(data: data)
      data = data.filter {|entry| entry[i].eql?(epsilon[i]) }

      break if data.count == 1
    end

    data.first.join.to_i(2)
  end
end

submarine = Submarine.new(data: File.read('input.txt'))
puts submarine.oxygen * submarine.co2
