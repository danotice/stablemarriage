
#' Safe Implementation of the fundamental algorithm for the stable marriage problem
#'
#' A function that takes a pair of preference tables, checks that they are compatible,
#' and if they are, runs the Fundamental Algorithm to find a stable matching. See \code{\link{find_stable_marriages}}. 
#' 
find_stable_marriages_safe = function(male_pref, female_pref, U){
  # a safe implementation of the fundamental algorithm
  
  safe = check_pref_tables(male_pref, female_pref) #changes that input is valid
  if (safe){
    find_stable_marriages(male_pref, female_pref, U)
  }
}