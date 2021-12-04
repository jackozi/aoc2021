class Board
  attr_accessor :grid, :won, :score

  def initialize(grid)
    @grid = grid
  end

  def draw(draw)
    (0...5).each do |row|
      (0...5).each do |col|
        grid[row][col] = -1 if grid[row][col] == draw
      end
    end
  end

  def won?
    verts = grid.transpose
    (0...5).any? { grid[_1].all?(&:negative?) || verts[_1].all?(&:negative?) }
  end

  def to_s
    "winner ##{won} with score #{score}"
  end
end

data = File.read("input.txt").split("\n")

draws = data.shift.split(',').map(&:to_i)
boards = data.each_slice(6).map do |b|
  Board.new(b[1,5].map { _1.strip.split.map(&:to_i) })
end

draws.each do |draw|
  boards.each do |board|
    next if board.won?

    board.draw(draw)

    if board.won?
      board.score = board.grid.flatten.select(&:positive?).sum * draw
      board.won = boards.select(&:won?).count
    end
  end
end

puts boards.sort_by(&:won)
