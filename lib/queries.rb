# Who did Jon Stewart have on the Daily Show the most?
def guest_with_most_appearances
  sql = <<-SQL
  SELECT guest_name
  FROM daily_show
  GROUP BY guest_name
  ORDER BY COUNT(guest_name) DESC LIMIT 1;
  SQL
  DB[:conn].execute(sql)
end

# What was the most popular profession of guest for each year Jon Stewart hosted the Daily Show?
def most_popular_profession_per_year
  sql = <<-SQL
  SELECT occupation, year
  FROM daily_shows
  GROUP BY year
  ORDER BY COUNT(year);
  SQL
  DB[:conn].execute(sql)
end


# What profession was on the show most overall?
def most_popular_profession
  sql = <<-SQL
  SELECT occupation
  FROM daily_shows
  GROUP BY occupation
  ORDER BY COUNT(occupation) DESC LIMIT 1;
  SQL
  DB[:conn].execute(sql)
end



# How many people did Jon Stewart have on with the first name of Bill?
def num_named_bill
  sql = <<-SQL
  SELECT COUNT(guest_name)
  FROM daily_shows
  WHERE guest_name LIKE "Bill%";
  SQL
  DB[:conn].execute(sql)
end

# What dates did Patrick Stewart appear on the show?
def captain_picard
  sql = <<-SQL
  SELECT show
  FROM daily_shows
  WHERE guest_name = 'Patrick Stewart';
  SQL
  DB[:conn].execute(sql)
end

# Which year had the most guests?
def year_of_many
  sql = <<-SQL
  SELECT year, COUNT(id)
  FROM daily_shows
  GROUP BY year
  ORDER BY COUNT(id) DESC LIMIT 1;
  SQL
  DB[:conn].execute(sql)
end

# What was the most popular "Group" for each year Jon Stewart hosted?
def pop_group_per_year
  sql = <<-SQL
  SELECT group_name, year
  FROM daily_shows
  GROUP BY year
  ORDER BY COUNT(group_name) DESC;
  SQL
  DB[:conn].execute(sql)
end
