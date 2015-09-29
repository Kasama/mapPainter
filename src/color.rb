class Color

  attr_reader :color

  @each = [:blue, :yellow, :red, :green, nil]
  @counter = 0

  def self.none
    Color.new nil
  end

  def self.each(&block)
    @each.each block
  end

  def eql?(other)
    unless other.color.nil?
      if other.color == @color
        return true
      end
    end
    false
  end

  def initialize(color)
    if @each.include? color
      @color = color
    else
      @color = nil
    end
  end

  def next_color
    i = @each.index @color
    i = i + 1
    @each[i % @each.length]
  end

end