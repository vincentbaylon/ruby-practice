require 'pp'

class Graph
  @adjency_list = {}

  def initialize
    @adjency_list = {}
  end

  def add_vertex(vertex)
    if !@adjency_list[vertex]
      @adjency_list[vertex] = []
    end
  end

  def add_edge(vertex_one, vertex_two)
    @adjency_list[vertex_one] << vertex_two
    @adjency_list[vertex_two] << vertex_one
  end
end

g = Graph.new
g.add_vertex('Tokyo')
g.add_vertex('San Francisco')
g.add_vertex('Aspen')
g.add_edge('Tokyo', 'Aspen')

pp g

