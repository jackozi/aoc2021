class Submarine
  attr_accessor :depth, :position, :aim

  def initialize
    @depth, @position, @aim = 0, 0, 0
  end

  def result
    depth * position
  end
end

submarine = Submarine.new

File.open('input.txt').each do |line|
  direction, distance = line.split
  case direction
  when "forward"
    submarine.position += distance.to_i
    submarine.depth += distance.to_i * submarine.aim
  when "up"
    submarine.aim -= distance.to_i
  when "down"
    submarine.aim += distance.to_i
  end
end

puts submarine.result
