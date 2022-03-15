
#' Check that a pair of preference tables are compatible
#' Tests if the tables are valid:
#' - same length keys between tables
#' - all values in one table are keys in the other
#' - length compatibility within tables confirmed by first 2 checks
#' 
#' @param male_pref Male preference table (list or dataframe)
#' @param female_pref Female preference table (list or dataframe)
#'
#' @return TRUE if tables are valid, FALSE otherwise
#' 
#' @examples
#' check_pref_tables(male1,female1)
#' check_pref_tables(male_prefs1,female_prefs3) #incompatible dimensions
#' 
check_pref_tables = function(male_pref, female_pref){
  # Check that a pair of preference tables are valid
  # Input: 2 preference tables - dictionary with string keys, list values
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
