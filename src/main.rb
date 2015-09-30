require './map_reader.rb'
require './backtracking.rb'
require './node'
require './color'
require './graph'
require './graph_fc'
require './node_fc'
require './new_hash'

map = MapReader.read_map '../testCases/brasil.in'
graph = Graph.new map[:graph]
opreation = map[:operation]
=begin
  a = Simples
  b = a + Forward Check
  c = b + MVR
  d = c + Grau
=end
b = Backtracking.new graph

b.backtracking graph.first
puts b.graph.to_s
