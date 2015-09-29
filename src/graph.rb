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

end