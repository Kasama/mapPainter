class GraphMVR < GraphFC

  def next(node)

    index = 0
    min = 99999999 # big number
    nodes.values.each_with_index do |n, i|
      if !n.color.present? and (a = n.forward_check_hash.number_of_zeros) < min
        puts "node #{n.name} has #{a.to_s} zeros"
        min = a
        index = i
      end
    end
    puts nodes.values[index].to_s
    nodes.values[index]

  end

end