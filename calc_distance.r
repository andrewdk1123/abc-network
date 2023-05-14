calc_distance <- function(sim_data, obs_data)
{
  norm <- sqrt(sum(abs(obs_data - sim_data) ^ 2))
  
  distance <- 0.5 * norm
  
  return(distance)
}
