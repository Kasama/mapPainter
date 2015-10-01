class GraphGrau < GraphMVR

  def next(node)

    min = 99999999 # big number

    nodes.values.each do |n|
      if !n.color.present? and (a = n.forward_check_hash.number_of_zeros) < min
        min = a
        puts "+=+= found n as #{n} min is now #{min}"
      end
    end

    selected = Array.new

    nodes.values.each do |n|
      if !n.color.present? and n.forward_check_hash.number_of_zeros == min
        selected.push n
      end
    end

    selected.each_index do |i|
      puts "-=-= #{selected[i]}"
    end

    index = 0
    max = -1

    selected.each_with_index do |n, i|
      if (a = n.neighbors.length) > max
        max = a
        index = i
      end
    end

    puts "*=*= #{selected[index]}"
    selected[index]

  end

end