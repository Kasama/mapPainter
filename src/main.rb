require './map_reader.rb'
require './backtracking.rb'
require './node'
require './color'
require './graph'
require './graph_fc'
require './graph_mvr'
require './graph_grau'
require './node_fc'
require './new_hash'

map = MapReader.read_map '../testCases/Europe.in'
graph = GraphGrau.new map[:graph]
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
