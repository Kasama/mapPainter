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

	attr_reader :graph

  def initialize(graph)
    @graph = graph
  end

  def backtracking(node)

		puts "entered backtrack!\n node = '#{node.to_s}' class = '#{node.class}'"
		puts "last color = #{@graph.last.color.to_s}"
		if @graph.all_colored
			puts 'finished successfully!'
			return true
		end

	  unless node
			puts 'node was null, returning'
		  return false
		end

	  while node.set_valid_color.present?
			puts "current color = #{node.color}"
		  return true if backtracking(@graph.next node)
			puts "came back from backtrack, node = #{node.to_s}"
		end

		puts "voltando da recursão, nó atual #{node.to_s}"

	  # unless @graph.first.color
			# puts 'failed to set colors, dats fucked up'
			# false
	  # end

  end
end
