import itertools

# Distance matrix (4 cities: A, B, C, D)
# distance[i][j] represents the cost to go from city i to city j
distance = [
    [0, 29, 20, 21],  # A
    [29, 0, 15, 17],  # B
    [20, 15, 0, 28],  # C
    [21, 17, 28, 0]   # D
]

def tsp(distance):
    cities = list(range(len(distance)))
    min_cost = float('inf')
    best_path = []

    # Generate all possible paths starting and ending at city 0
    for perm in itertools.permutations(cities[1:]):
        path = [0] + list(perm) + [0]
        cost = sum(distance[path[i]][path[i + 1]] for i in range(len(path) - 1))
        
        if cost < min_cost:
            min_cost = cost
            best_path = path

    return best_path, min_cost

# Solve the TSP
path, cost = tsp(distance)

# Print the result
city_names = ['A', 'B', 'C', 'D']
named_path = [city_names[i] for i in path]

print("Best path:", " -> ".join(named_path))
print("Minimum cost:", cost)

