class Submarine
  attr_accessor :blocks

  def windows
    blocks.map{|window| window.reduce(:+)}
  end

  def result
    windows.each_cons(2).select{|last, curr| curr>last}.count
  end
end

submarine = Submarine.new
submarine.blocks = File.open('input.txt').map { |line| line.to_i }.each_cons(3)
puts submarine.result
