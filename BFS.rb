class Graph
  def initialize(vertices)
    @vertices = vertices
    @adjacency_list = {}
  end

  def add_edge(u, v)
    @adjacency_list[u] ||= []
    @adjacency_list[u] << v
  end

  def bfs(start_vertex)
    visited = Array.new(@vertices, false)
    queue = []
    result = []

    visited[start_vertex] = true
    queue.push(start_vertex)

    until queue.empty?
      current_vertex = queue.shift
      result << current_vertex

      if @adjacency_list[current_vertex]
        @adjacency_list[current_vertex].each do |neighbor|
          unless visited[neighbor]
            visited[neighbor] = true
            queue.push(neighbor)
          end
        end
      end
    end

    result
  end
end


graph = Graph.new(8)
graph.add_edge(0, 1)
graph.add_edge(0, 3)
graph.add_edge(1, 2)
graph.add_edge(1, 4)
graph.add_edge(2, 5)
graph.add_edge(3, 6)
graph.add_edge(4, 5)
graph.add_edge(4, 7)

start_vertex = 0
puts "BFS from vertex #{start_vertex}: #{graph.bfs(start_vertex)}"
