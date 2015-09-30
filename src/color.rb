class Color

  attr_reader :color

  def present?
    @color
  end

  def self.none
    Color.new nil
  end

  def self.each(&block)
    @possible_colors.each block
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
    @possible_colors = [:blue, :yellow, :red, :green, nil]
    if @possible_colors.include? color
      @color = color
    else
      @color = nil
    end
  end

  def to_s
    a = @color || 'nil'
    a.to_s
  end

  def next_color
    i = @possible_colors.index @color
    # puts "=====inside next color, color = #{@color.to_s} i = #{i.to_s}"
    i = i + 1
    @color = @possible_colors[i % @possible_colors.length]
    # puts "=====color = #{@color.to_s}"
    @color
  end

end