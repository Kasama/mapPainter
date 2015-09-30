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

  def to_s
    s = "#{@name}: {#{@color.to_s}| "

    @neighbors.each do |n|
      s.concat "[#{n.name}:#{n.color}] "
    end

    s.concat "}\n"
  end

  def set_valid_color
    begin
      @color.next_color
    end until check_neighbors_colors
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
