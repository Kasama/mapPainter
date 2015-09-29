class Backtracking

  def initialize(graph)
    @graph = graph
  end

  def backtracking

    # tem que ter um next pra node no graph
    @graph.each_node do |n| # isso não pode estar assim (RECURSIVIDADE)
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
    end


  end

end
