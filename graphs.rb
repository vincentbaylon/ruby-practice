require "pp"

class Graph
  @adjacency_list = {}

  def initialize
    @adjacency_list = {}
  end

  def add_vertex(vertex)
    if !@adjacency_list[vertex]
      @adjacency_list[vertex] = []
    end
  end

  def add_edge(vertex_one, vertex_two)
    @adjacency_list[vertex_one] << vertex_two
    @adjacency_list[vertex_two] << vertex_one
  end

  def remove_edge(vertex_one, vertex_two)
    @adjacency_list[vertex_one] = @adjacency_list[vertex_one].select { |v| v != vertex_two }
    @adjacency_list[vertex_two] = @adjacency_list[vertex_two].select { |v| v != vertex_one }
  end

  def remove_vertex(vertex)
    while @adjacency_list[vertex].length > 0
      adjacent_vertex = @adjacency_list[vertex].pop
      remove_edge(vertex, adjacent_vertex)
    end

    @adjacency_list.delete(vertex)
  end

  def depth_first_recursive(start)
    @res = []
    @visited = {}

    dfs(start)

    @res
  end

  def dfs(vertex)
    return nil if vertex.nil?

    @visited[vertex] = true
    @res << vertex

    @adjacency_list[vertex].each do |neighbor|
      if @visited[neighbor].nil?
        dfs(neighbor)
      end
    end
  end

  def depth_first_iterative(start)
    stack = [start]
    res = []
    visited = {}

    visited[start] = true

    while stack.length > 0
      current_vertex = stack.pop
      res << current_vertex

      @adjacency_list[current_vertex].each do |neighbor|
        if visited[neighbor].nil?
          visited[neighbor] = true
          stack << neighbor
        end
      end
    end

    res
  end
end

g = Graph.new
g.add_vertex("A")
g.add_vertex("B")
g.add_vertex("C")
g.add_vertex("D")
g.add_vertex("E")
g.add_vertex("F")

g.add_edge("A", "B")
g.add_edge("A", "C")
g.add_edge("B", "D")
g.add_edge("C", "E")
g.add_edge("D", "E")
g.add_edge("D", "F")
g.add_edge("E", "F")

pp g.depth_first_iterative("A")
