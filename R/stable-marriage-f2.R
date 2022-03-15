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


check_pref_tables = function(male_pref, female_pref){
  
  # Input: 2 preference tables - dictionary with string keys, list values
  # 
  # Tests if the tables are valid:
  # - same length keys between tables
  # - all values in one table are keys in the other
  # - length compatibility within tables confirmed by first 2 checks
  # 
  # Output: True if tables are valid, False otherwise
  
  M = names(male_pref)
  FM = names(female_pref)
  
  #subfunction to check if all rows of a table match the keys of the other
  compare_values = function(values,keys){      
    for (p in values){ #values is a list of lists
      if (any(sort(p) != sort(keys))){return(FALSE)}
    }
    return(TRUE) 
  }
  
  #check number of rows
  if (length(M)!=length(FM)) {
    print('Different number of males and females')
    return(FALSE)    
  }
  
  #check elements across tables compatible
  else if  (!compare_values(male_pref,FM) | !compare_values(female_pref,M)){
    print('Someone has an ineligible preference')
    return(FALSE)  
  }
  
  else{return(TRUE)}

  
}

find_stable_marriages_safe = function(male_pref, female_pref, U){
  # a safe implementation
  safe = check_pref_tables(male_pref, female_pref)
  if (safe){
    find_stable_marriages(male_pref, female_pref, U)
  }
}