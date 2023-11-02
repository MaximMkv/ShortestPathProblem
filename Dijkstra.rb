class Graph
    def initialize(vertices)
      @vertices = vertices
      @adjacency_list = {}
    end
  
    def add_edge(u, v, weight)
      @adjacency_list[u] ||= []
      @adjacency_list[u] << { vertex: v, weight: weight }

            # Ребра у зворотному напрямку, щоб обчислити відстані від дочірньої вершини до батьківської
    @adjacency_list[v] ||= []
    @adjacency_list[v] << { vertex: u, weight: weight }
    end
  
    def dijkstra(start_vertex)
        distances = Array.new(@vertices, Float::INFINITY)
        visited = Array.new(@vertices, false)
      
        distances[start_vertex] = 0
      
        (@vertices - 1).times do
          u = min_distance(distances, visited)
          visited[u] = true
      
          next unless @adjacency_list.key?(u)
      
          @adjacency_list[u].each do |neighbor|
            v = neighbor[:vertex]
            w = neighbor[:weight]
            alt = distances[u] + w
            distances[v] = alt if alt < distances[v]
          end
        end
      
        distances
      end
      
  
    private
  
    def min_distance(distances, visited)
      min = Float::INFINITY
      min_index = -1
  
      distances.each_with_index do |distance, index|
        if !visited[index] && distance <= min
          min = distance
          min_index = index
        end
      end
  
      min_index
    end
  end
  

  graph = Graph.new(6)
  graph.add_edge(0, 1, 7)
  graph.add_edge(0, 2, 9)
  graph.add_edge(0, 5, 14)
  graph.add_edge(1, 2, 10)
  graph.add_edge(1, 3, 15)
  graph.add_edge(2, 3, 11)
  graph.add_edge(2, 5, 2)
  graph.add_edge(3, 4, 6)
  graph.add_edge(4, 5, 9)
  
  start_vertex = 0
  shortest_distances = graph.dijkstra(start_vertex)
  puts "Shortest distances from vertex #{start_vertex}: #{shortest_distances}"
  
