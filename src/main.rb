# Dir.foreach('.') do |file|
#   require File.absolute_path file unless file =~ /main/
# end
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
require './global_counter'

GlobalCounter.init

map = MapReader.read_map

case map[:operation]
  when 'a'
    graph = Graph.new map[:graph]
    backtrack = "'Simple Backtrack'"
  when 'b'
    graph = GraphFC.new map[:graph]
    backtrack = "'Forward Check'"
  when 'c'
    graph = GraphMVR.new map[:graph]
    backtrack = "'Forward Check + MVR'"
  when 'd'
    graph = GraphGrau.new map[:graph]
    backtrack = "'Forward Check + MVR + Grau'"
end

puts "running with #{backtrack}"
b = Backtracking.new graph

start = Time.now
b.backtracking graph.first
finish = Time.now
time = finish - start
color_assignments = GlobalCounter.get

puts 'answer given by algorithm:'
puts b.graph.to_s
puts '--------------------------'
puts "total time: #{time}"
puts "number of assignments #{color_assignments}"
