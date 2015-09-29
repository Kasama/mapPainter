    # tem que ter um next pra node no graph
    #@graph.each_node do |n| # isso não pode estar assim (RECURSIVIDADE)
      # return 'success' if last_node has valid color
      # for each valid color !nil
      #   backtracking(next_node) # TODO criar next_node
      # end
      #----------------------------
      # Se ultimo nó com cor válida => caboo(:deu_bom)
      # Roda por todas as cores até nao ter mais cor
      #   Recursão
      # end
      # Se prieiro nó sem cor válida => caboo(:fodeu)
    #end

class Backtracking

  def initialize(graph)
    @graph = graph
  end

  def backtracking(node)
		
	  unless node 
		  return false
	  end

	  if graph.last.color
		return true
	  end

	  while node.set_valid_color
		  backtracking(graph.next)

	  end

	  unless graph.first.color
		  false
	  end

  end
end
