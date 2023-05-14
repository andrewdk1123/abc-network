abc_sim <- function(n_sims, epsilon){
    obs_times = attributes[attributes$adoption_date <= 18,]$adoption_date
    obs_mean = mean(obs_times)
  
    probs = runif(n_sims, min = 0, max = 1)
    mean_diffs = rep(NA, n_sims)
  
    accept_number = epsilon * n_sims
  
    for (i in 1:length(probs)){
        prob = probs[i]
    
        new_data <- sim_model(network, init_adopt, prob, 18)
        adopt_times <- na.omit(new_data$adopt_time)
    
        mean_diffs[i] <- abs(mean(adopt_times) - obs_mean)
    }
  
    ordered_diffs <- mean_diffs[order(mean_diffs)]
    accepted_probs <- probs[c(1:accept_number)]
    print(accepted_probs)
}
