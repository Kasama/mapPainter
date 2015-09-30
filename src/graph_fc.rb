class GraphFC < Graph
  def create_node(name)
    NodeFC.new name
  end
end