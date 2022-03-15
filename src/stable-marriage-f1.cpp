//all necessary libraries
#include <Rcpp.h>
#include <unordered_map>
#include <iostream>
#include <vector>
#include <list>
#include <map>
#include <string>

using namespace Rcpp;

// helper function to convert preference table from R input to unordered map
std::unordered_map<std::string, std::list<std::string>> converter_prefs(List list){
  std::unordered_map<std::string, std::list<std::string>> out;
  
  CharacterVector names = list.names(); //keys in map
  
  for(int i = 0; i < names.size(); i++){
    std::string name = Rcpp::as<std::string>(names[i]);
    std::list<std::string> ls = list[i];
    out[name] = ls;
  }
  
  return out;
}

// helper function that calculates the score given a person and the preference table
std::unordered_map<std::string,long> get_scores_int(
    std::string m,
    std::unordered_map<std::string, std::list<std::string>> male_pref)
{
  //initialising variables
  std::vector<std::string> prefs(male_pref[m].begin(), male_pref[m].end());   //convert list of preferences to vector
  long N = prefs.size();
  
  //calculating scores
  std::unordered_map<std::string,long> scores;
  
  for(long i = 0; i < N; i++)
  {
    scores[prefs.at(i)] = N - i;        
  }
  
  return scores;
  
}


/* a function that uses preference tables and runs the Fundamental Algorithm 
 * to find a stable marriage.
 * Also takes the string to assign to the undesirable male.
 * Returns a matching with male keys and female values.
 */
// [[Rcpp::export]]
std::unordered_map<std::string, std::string> find_stable_marriages(
    List male_prefs, 
    List female_prefs, 
    std::string U)
{        
  //takes pair of preference tables, returns a stable matching as a R named character vector
  
  //declaring variables
  std::string X,x,temp;    
  std::unordered_map<std::string, std::string> matchings, matchingsFinal;   
  
  std::unordered_map<std::string, std::list<std::string>> male_pref = converter_prefs(male_prefs);
  std::unordered_map<std::string, std::list<std::string>> female_pref = converter_prefs(female_prefs);
  
  //list of males from preference table
  std::list<std::string> M;  
  for(auto& p : male_pref)
  {
    M.push_back(p.first);        
  }
  M.sort(); //increases complexity, but ensures repeatability
  
  long n = M.size();
  
  for(auto p : female_pref)
  {
    matchings[p.first] = U;              //creating initial temporary initial matching     
    female_pref[p.first].push_back(U);   //updating female table to include undesirable male
    
  }
  
  //main loop of fundamental algorithm
  for(int k = 0; k < n; k++)
  {
    
    // checking interuption every 10 iterations
    if (k % 10 == 0){
      Rcpp::checkUserInterrupt();
    }
    
    X = M.front();
    M.pop_front();
    
    for(;X != U;)
    {
      x = male_pref[X].front(); //X's best choice
      std::unordered_map<std::string,long> scores = get_scores_int(x, female_pref);
      
      //update female's partner if better than current
      if(scores[X] > scores[matchings[x]])
      {
        temp = X;
        X = matchings[x];   //X is x former partner
        matchings[x] = temp;
      }
      
      if(X != U){male_pref[X].pop_front();} //remove x from X's list           
    }
  }
  
  //final matching with male keys, female values
  for(auto p : matchings)
  {
    matchingsFinal[p.second] = p.first;
  }
  
  return matchingsFinal;       
  
}


