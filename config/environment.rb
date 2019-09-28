require 'bundler'
require "sqlite3"
require 'csv'
require 'pry'

Bundler.require

# Setup a DB connection here
DB = SQLite3::Database.new('db/database3.db')

#DB = SQLite3::Database.new(':memory:')

