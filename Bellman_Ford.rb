class Graph
  def initialize(vertices)
    @vertices = vertices
    @edges = []
  end

  def add_edge(u, v, weight)
    @edges << { start: u, target: v, cost: weight }
  end

  def bellman_ford(start_vertex)
    distances = Array.new(@vertices, Float::INFINITY)
    distances[start_vertex] = 0

    (@vertices - 1).times do
      @edges.each do |edge|
        u = edge[:start]
        v = edge[:target]
        w = edge[:cost]
        if distances[u] + w < distances[v]
          distances[v] = distances[u] + w
        end
      end
    end

    @edges.each do |edge|
      u = edge[:start]
      v = edge[:target]
      w = edge[:cost]
      if distances[u] + w < distances[v]
        puts "Граф містить цикл від'ємної ваги"
        return
      end
    end

    distances
  end
end


graph = Graph.new(5)
graph.add_edge(0, 1, -1)
graph.add_edge(0, 2, 4)
graph.add_edge(1, 2, 3)
graph.add_edge(1, 3, 2)
graph.add_edge(1, 4, 2)
graph.add_edge(3, 1, 1)
graph.add_edge(4, 3, -3)

start_vertex = 0
shortest_distances = graph.bellman_ford(start_vertex)
puts "Shortest distances from vertex #{start_vertex}: #{shortest_distances}"
