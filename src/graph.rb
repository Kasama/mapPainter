class Graph

  def initialize(adj_list)

    @nodes = Array.new
    adj_list.each_key do |k|
      @nodes.push(Node.new k, adj_list[k])
    end

  end

  def each_node(&block)
    @nodes.each block
  end

  def next(node)
    i = @nodes.index node
    i = i + 1

	if i >= nodes.length
	   	nil
	else 
		i
	end
  end

  def last
	nodes[-1]
  end

  def first
	nodes[0]
  end
end
