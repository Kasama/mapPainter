class MapReader
  def self.read_map
=begin
     all lines in the file follow /^.+:.*\.$/
     ^ = beginning of line
     .+ = any character 1 or more times
     : = ':' literally
     .* = any character 0 or more times
     \. = '.' literally
     $ = end of line
=end
    # open file to read
    file = ARGF

    # initialize the graph
    graph = Hash.new do |hash, key|
      # each entry have a empty array to start with
      hash[key] = Array.new
    end

    # reads 'op' character in the first line
    op = file.readline.to_s.match(/^\d+\s*(.)/).captures.first

    # fill in the graph
    # for each file line
    file.each_line do |l|
      # ignore any lines with numbers in it or empty
      next if l.to_s.match /\d+.*/ or l.to_s.match /^\s*$/
      # set the node_name to what comes before the ':' and neighbors to what comes after it
      node_name, neighbors = l.to_s.match(/^(.+):(.*).$/i).captures
      # turn the string into a symbol without leading/following spaces
      node_sym = node_name.to_sym
      # touch the graph with the node name to create an array for it
      graph[node_sym]
      # split the neighbors
      neighbors = neighbors.split(', ')
      #add each neighbor to the array
      neighbors.each do |n| graph[node_sym].push n.strip end
    end

    # returns a hash containing the graph and operation
    {graph: graph, operation: op}

  end
end
