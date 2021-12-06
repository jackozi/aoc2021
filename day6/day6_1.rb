class Lanterfish
  attr_accessor :reproduces_after

  def initialize(reproduces_after: 9)
    @reproduces_after = reproduces_after
  end

  def age
    if @reproduces_after.zero?
      @reproduces_after = 6
    else
      @reproduces_after -= 1
    end
  end

  def repoducing?
    @reproduces_after.zero?
  end

  def to_s
    "age: #{@reproduces_after}"
  end
end

lanternfish = []
File.read('input.txt').split(",").map(&:to_i).each do |days|
  lanternfish << Lanterfish.new(reproduces_after: days)
end

80.times do
  lanternfish.select(&:repoducing?).each do
    lanternfish << Lanterfish.new
  end
  lanternfish.each(&:age)
end

puts lanternfish.count
