# Write methods that return SQL queries for each part of the challeng here


def guest_with_most_appearances
  "SELECT name, COUNT(show)
  FROM guests 
  GROUP BY name
  ORDER BY COUNT(show) DESC LIMIT 1"
end

def most_popular_profession_by_year
  "SELECT occupation, COUNT(id)
  FROM guests
  WHERE year = ?
  GROUP BY occupation
  ORDER BY COUNT(id) DESC LIMIT 1"
end

def most_popular_profession_overall
  "SELECT occupation, COUNT(id)
  FROM guests
  GROUP BY occupation
  ORDER BY COUNT(id) DESC LIMIT 1"
end

def number_of_bills
  "SELECT COUNT(id)
  FROM guests
  WHERE name like '%Bill%'"
end

def patrick_stewart_date
  "SELECT show 
  FROM guests
  WHERE name = 'Patrick Stewart'"
end

def top_year
  "SELECT year 
  FROM guests
  GROUP BY year
  ORDER BY SUM(id) DESC LIMIT(1)"

end

def most_popular_group
  "SELECT category
  FROM guests
  GROUP BY category
  ORDER BY SUM(id) DESC LIMIT(1)"
end