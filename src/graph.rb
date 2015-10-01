class Graph

  attr_reader :nodes

  def initialize(adj_list)
    @nodes = Hash.new
    adj_list.each_key do |k|
      @nodes[k] = create_node k
    end
    adj_list.each_key do |k|
      adj_list[k].each do |neighbor|
        @nodes[k].add_neighbor @nodes[neighbor.to_sym]
      end
    end
  end

  def all_colored
    @nodes.values.reduce(true) { |memo, n| memo && n.color.present? }
  end

  def create_node(name)
    Node.new name
  end

  def each_node(&block)
    @nodes.each block
  end

  def next(node)
    i = @nodes.values.index node
    i = i + 1

    if i >= @nodes.length
      nil
    else
      @nodes.values[i]
    end
  end

  def to_s
    s = ''
    @nodes.values.each do |n|
      s.concat n.to_s
      s.concat "\n"
    end
    s
  end

  def last
    @nodes.values.last
  end

  def first
    @nodes.values.first
  end
end
