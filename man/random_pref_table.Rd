% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/random_pref_table.R
\name{random_pref_table}
\alias{random_pref_table}
\title{Randomly generates a prefence table}
\usage{
random_pref_table(persons, choices)
}
\arguments{
\item{persons}{List of persons.}

\item{choices}{List of choices that a randomized for each person. Must be same length as \code{persons}.}
}
\value{
preference table (list)
}
\description{
Randomly generates a prefence list for each person based on the possible choices. Only creates a single preference table. 
Needs to be used twice, with reversed inputs, to create a pair of compatible preference tables.
}
\examples{
M = c('A','B','C')
FM = c('a','b','c','d','e')

set.seed(1111)
random_pref_table(M,FM)
random_pref_table(FM,M)
}
