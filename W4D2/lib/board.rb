require 'byebug'

class Board

  attr_accessor :cups
  attr_reader :name1, :name2

  def initialize(name1, name2)
      @name1 = name1
      @name2 = name2
      @cups = Array.new(14) { [] }
      self.place_stones
  end

  def place_stones
    (0...@cups.length).each do |idx|
      @cups[idx]=[:stone, :stone, :stone, :stone] unless (idx == 6 || idx == 13)
    end
    # helper method to #initialize every non-store cup with four stones each
  end

  def valid_move?(start_pos)
    raise ArgumentError.new "Invalid starting cup" if !(0..13).include?(start_pos)
    raise ArgumentError.new "Starting cup is empty" if @cups[start_pos].empty?
    true
  end

  def make_move(start_pos, current_player_name)
    current_player_name == name1 ? skip = 6 : skip = 13
    i = 1
    while i <= cups[start_pos].count

      cups[(start_pos+i) % 13] << cups[start_pos].pop
      i += 1
    end
  end

  def next_turn(ending_cup_idx)
    # helper method to determine whether #make_move returns :switch, :prompt, or ending_cup_idx
  end

  def render
    print "      #{@cups[7..12].reverse.map { |cup| cup.count }}      \n"
    puts "#{@cups[13].count} -------------------------- #{@cups[6].count}"
    print "      #{@cups.take(6).map { |cup| cup.count }}      \n"
    puts ""
    puts ""
  end

  def one_side_empty?
  end

  def winner
  end
end
