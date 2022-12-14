#PROBLEM

#rder this array of hashes based on the year of publication of each book, 
#from the earliest to the latest?

#ALGORITHM
# sort array
# - sort key: element[:published].to_i


books = [
  {title: 'One Hundred Years of Solitude', author: 'Gabriel Garcia Marquez', published: '1967'},
  {title: 'The Great Gatsby', author: 'F. Scott Fitzgerald', published: '1925'},
  {title: 'War and Peace', author: 'Leo Tolstoy', published: '1869'},
  {title: 'Ulysses', author: 'James Joyce', published: '1922'}
]


# books = books.sort do |a, b|
#   a[:published].to_i <=> b[:published].to_i
# end

books = books.sort_by do |book|
  book[:published]
end
p books