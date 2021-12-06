fish = {}
input = File.read('input.txt').split(',').map(&:to_i).map(&:to_s)
(0..9).map(&:to_s).each do |f|
  fish[f] = input.count(f)
end

256.times do
  temp_fish = fish['7'] + fish['0']
  fish['7'] = fish['8']
  fish['8'] = fish['0']
  fish['0'] = fish['1']
  fish['1'] = fish['2']
  fish['2'] = fish['3']
  fish['3'] = fish['4']
  fish['4'] = fish['5']
  fish['5'] = fish['6']
  fish['6'] = temp_fish
end

puts fish.except('9').values.reduce(&:+)
