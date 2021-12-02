class Submarine
  attr_accessor :windows

  def reduced_windows
    windows.map{|window| window.reduce(:+) }
  end

  def result
    reduced_windows.each_cons(2).select{|last, curr| curr > last }.count
  end
end

submarine = Submarine.new
submarine.windows = File.open('input.txt').map { |line| line.to_i }.each_cons(3)
puts submarine.result
