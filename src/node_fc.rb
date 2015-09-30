class NodeFC < Node

  attr_reader :forward_check_hash

  def initialize(args)
    super args
    @forward_check_hash = NewHash.new
    Color.colors.each do |c|
      forward_check_hash[c] = 0
    end
  end

  def check_neighbors_colors
    valid = super
    unless valid
      neighbors.each do |n|
        n.forward_check_hash.restore_key
      end
    end
    valid
  end

  def assign_next_color
    ret = super
    neighbors.each do |n|
      n.forward_check_hash.consume_key color
    end
    ret
  end

  def check_validity(neighbor)
    !(neighbor.color.eql? color) && neighbor.forward_check_hash.has_keys
  end


end