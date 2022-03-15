#Example preference tables from Lecture 1 of reference text

#example 1 - 4x4 tables
male_prefs1 = list('A'=c('c','b','d','a'),
  'B'=c('b','a','c','d'),
  'C'=c('b','d','a','c'),
  'D'=c('c','a','d','b')
  )

female_prefs1 = list('a'=c('A','B','C','D'),
  'b'=c('C','A','D','B'),
  'c'=c('C','B','D','A'),
  'd'=c('B','A','C','D') 
  )

#example 3 - 5x5 tables
male_prefs3 = list('A'=c('a','b','c','d','e'),
  'B'=c('b','c','d','e','a'),
  'C'=c('c','d','e','a','b'),
  'D'=c('d','e','a','b','c'),
  'E'=c('e','a','b','c','d')
)

female_prefs3 = list('a'=c('B','C','D','E','A'),
  'b'=c('C','D','E','A','B'),
  'c'=c('D','E','A','B','C'),
  'd'=c('E','A','B','C','D'),
  'e'=c('A','B','C','D','E')
)
