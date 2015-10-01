class Backtracking

	attr_reader :graph

  def initialize(graph)
    @graph = graph
  end

  def backtracking(node)

		if @graph.all_colored
			puts 'finished successfully!'
			return true
		end

	  unless node
			puts 'node was null, returning'
		  return false
		end

	  while node.set_valid_color.present?
		  return true if backtracking(@graph.next node)
		end

  end
end
