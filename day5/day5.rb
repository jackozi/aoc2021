class Seabottom
  def initialize
    @grid = Array.new(1001) {|i| Array.new(1001) {|i| 0 }}
  end

  def check(start, finish)
    x1,y1 = start.split(",").map(&:to_i)
    x2,y2 = finish.split(",").map(&:to_i)

    cords(x1,x2,y1,y2).each do |x, y|
      @grid[x][y] += 1
    end
  end

  def cords(x1,x2,y1,y2)
    if x1 == x2
      ([y1, y2].min..[y1, y2].max).zip([x1].cycle).map(&:reverse)
    elsif y1 == y2
      ([x1, x2].min..[x1, x2].max).zip([y1].cycle)
    elsif x1 < x2 && y1 < y2
      (x1..x2).zip(y1..y2)
    elsif x1 > x2 && y1 < y2
      (x2..x1).to_a.reverse.zip(y1..y2)
    elsif x1 > x2 && y1 > y2
      (x2..x1).to_a.reverse.zip((y2..y1).to_a.reverse)
    elsif x1 < x2 && y1 > y2
      (x1..x2).zip((y2..y1).to_a.reverse)
    end
  end

  def result
    @grid.map {|row| row.select {|i| i > 1}.count}.reduce(&:+)
  end
end

sb = Seabottom.new

File.open('input.txt').each do |line|
  start,finish = line.split(" -> ")
  sb.check(start, finish)
end

puts sb.result
