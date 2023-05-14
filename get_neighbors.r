get_neighbors <- function(starting_node, network, sim_attr){
    # Get the nodes the starting node interacts with
    neighbor_net = network[starting_node, network[starting_node,] == 1]
    neighbor_cols = colnames(neighbor_net)
    neighbor_idx = as.integer(substring(neighbor_cols, 2))
  
    neighbors = sim_attr[neighbor_idx,]
  
    return(neighbors)
}
