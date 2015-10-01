class NodeFC < Node

  attr_reader :forward_check_hash

  def initialize(args)
    super args
    @consumed_from = Array.new
    @forward_check_hash = NewHash.new
    Color.colors.each do |c|
      forward_check_hash[c] = 0
    end
  end

  def check_neighbors_colors
    valid = super
    unless valid
      @consumed_from.each do |n|
        puts "======restoring from '#{n.to_s}'"
        n.forward_check_hash.restore_key
        puts "====== n now has #{n.forward_check_hash.number_of_zeros}"
      end
      @consumed_from = Array.new
    end
    valid
  end

  def assign_next_color
    @consumed_from.each do |n|
      n.forward_check_hash.restore_key
    end
    @consumed_from = Array.new
    #devolve
    ret = super
    return ret if ret.nil?
    neighbors.each do |n|
      if n.forward_check_hash.has color
        puts "======consuming '#{ret}' from '#{n.to_s}' n = #{n.forward_check_hash.number_of_zeros}"
        @consumed_from.push n
        n.forward_check_hash.consume_key color
        puts "====== n now has #{n.forward_check_hash.number_of_zeros}"
      end
    end
    ret
  end

  def check_validity(neighbor)
    !(neighbor.color.eql? color) && (neighbor.forward_check_hash.has_keys || neighbor.color.present?)
  end


end