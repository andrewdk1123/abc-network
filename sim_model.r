sim_model <- function(network, init_nodes, p_adopt, n_step){
    
    sim_attr = data.frame(doctor = as.integer(rownames(attributes)), adopt_time = NA)
  
    # Set the initial adoptors in the data
    init_nodes = as.integer(rownames(init_adopt))
    sim_attr[init_nodes,]$adopt_time = 1
  
    for (i in 2:n_step){
        
        # Get the row number of the adopted nodes
        adopted_nodes = rownames(sim_attr[!is.na(sim_attr$adopt_time),])
        adopted_nodes = as.integer(adopted_nodes)
    
        # Loop through the nodes which have adopted
        for (j in adopted_nodes){
            current_doc = sim_attr[j,]$doctor
      
            # Get the nodes the starting node interacts with
            neighbors = get_neighbors(current_doc, network, sim_attr)
      
            # Drop any possible NA values
            neighbors = neighbors[!is.na(neighbors$doctor),]
      
            if (nrow(neighbors) > 0){
                # Select a neighbor
                samples = neighbors$doctor
                neighbor_idx = sample(samples, 1)
        
                neighbor = neighbors[neighbors$doctor == neighbor_idx,]
        
                # Check to see if the neighbor has already adopted
                neighbor_adopt_date = neighbor$adopt_time
        
                if (is.na(neighbor_adopt_date) || neighbor_adopt_date > n_step){
                # Check to see if the doctor will adopt
                    adopted = rbinom(n = 1, size = 1, prob = p_adopt)
          
                    if (adopted == 1){
                        sim_attr[sim_attr$doctor == neighbor$doctor,]$adopt_time = i
                    }
                }
            }
        }
    }
  
    return(sim_attr)
}