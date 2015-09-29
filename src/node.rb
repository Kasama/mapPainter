class Node

  attr_reader :color
  attr_reader :name
  attr_reader :neighbors

  def initialize(name, neighbors)
    @name = name
    @neighbors = neighbors
    @color = Color.none
  end

  def each_neighbor(&block)
    neighbors.each block
  end

  def has_next_color
    # flag = !initial_color.present?
    # Color.each do |c|
    #   # pode dar segfault, fica de olho
    #   flag = true if initial_color == c
    #   if flag
    #     @color = Color.new c
    #     break if check_neighbors_colors
    #   end
    # end
    # @color
  end

  def set_valid_color
    @color.next_color
    until check_neighbors_colors
      @color.next_color
    end
    @color
  end

  def check_neighbors_colors
    valid = true
    @neighbors.each do |n|
      valid = valid && !(n.color.eql? @color)
    end
    valid
  end

  private :check_neighbors_colors

end