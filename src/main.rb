require './map_reader.rb'
require './backtracking.rb'
require './node'
require './color'
require './graph'

map = MapReader.read_map '../testCases/usa.in'
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

