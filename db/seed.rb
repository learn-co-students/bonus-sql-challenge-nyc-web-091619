# Parse the CSV and seed the database here! Run 'ruby db/seed' to execute this code.
require_relative "../config/environment.rb"

parsed_file = CSV.read('db/daily_show_guests.csv', headers: true)

create = <<-SQL
    CREATE TABLE guests (
        id INTEGER PRIMARY KEY, 
        year INTEGER, 
        occupation TEXT, 
        show TEXT,
        category TEXT, 
        name TEXT
        )
SQL

DB.execute(create)

parsed_file.each do |row|
    DB.execute("INSERT INTO guests (year, occupation, show, category, name) VALUES (?, ?, ?, ?, ?)", row[0], row[1], row[2], row[3], row[4])
end





