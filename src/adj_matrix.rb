class AdjMatrix

  def initialize(n)
    @matrix = Array.new n do |_|
      Array.new n, 0
    end
    @node_names = Array.new n do |_|
      Array.new n, Node.null
    end
  end

  def connect(a, b)
    @matrix[a][b] = 1
    @matrix[b][a] = 1
  end

  def disconnect(a, b)
    @matrix[a][b] = 0
    @matrix[b][a] = 0
  end

end
