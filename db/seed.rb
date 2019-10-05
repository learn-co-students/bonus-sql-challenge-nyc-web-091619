# Parse the CSV and seed the database here! Run 'ruby db/seed' to execute this code.
require 'csv'

def create_table
  sql = <<-SQL
  CREATE TABLE IF NOT EXISTS daily_shows (
    id INTEGER PRIMARY KEY,
    year INTEGER,
    occupation TEXT,
    show TEXT,
    group_name TEXT,
    guest_name TEXT
  );
  SQL
  DB[:conn].execute(sql)
end

def insert_from_row(row)
  sql = <<-SQL
  INSERT INTO daily_shows (year, occupation, show, group_name, guest_name) VALUES (?, ?, ?, ?, ?);
  SQL
  DB[:conn].execute(sql, row[0], row[1], row[2], row[3], row[4])
end

def populate_table
  data_get = parse_data
  table_headers = data_get[0]
  data_get.shift
  data_get.each do |row|
    insert_from_row(row)
  end
end

def setup_database
  create_table
  populate_table
end
