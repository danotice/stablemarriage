#' Randomly generates a prefence table
#'
#' Randomly generates a prefence list for each person based on the possible choices. Only creates a single preference table. 
#' Needs to be used twice, with reversed inputs, to create a pair of compatible preference tables.
#'
#' @param persons List of persons.
#' @param choices List of choices that a randomized for each person. Must be same length as \code{persons}.
#'
#' @return preference table (list)
#' 
#' @examples
#' M = c('A','B','C')
#' FM = c('a','b','c','d','e')
#'
#' set.seed(1111)
#' random_pref_table(M,FM)
#' random_pref_table(FM,M)

random_pref_table = function(persons, choices){
  # Input: two lists of distinct and mutually disjoint symbols of equal length
  # Randomly generates a prefence list for each person based on the possible choices
  # Output: random preference table -- DOES NOT CREATE A PAIR OF TABLES
  
  N = length(persons)
  
  prefs = list()
  for (p in persons){
    prefs[p] = list(sample(choices,N)) 
  }
  
  return(prefs)
}

