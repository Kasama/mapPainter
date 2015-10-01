class Node

  attr_reader :color
  attr_reader :name
  attr_reader :neighbors

  def initialize(name)
    @name = name
    @neighbors = Array.new
    @color = Color.none
  end

  def add_neighbor(neighbor)
    @neighbors.push neighbor
  end

  def each_neighbor(&block)
    neighbors.possible_colors block
  end

  def to_s
    "#{@name}: #{@color.to_s}"
  end

  def set_valid_color
    begin
      assign_next_color
    end until check_neighbors_colors
    GlobalCounter.increment if @color
    @color
  end

  def assign_next_color
    @color.next_color
  end

  def check_neighbors_colors
    valid = true
    neighbors.each do |n|
      valid = valid && check_validity(n)
    end
    valid
  end

  def check_validity(neighbor)
    !(neighbor.color.eql? color)
  end

  private :check_neighbors_colors, :check_validity

end
