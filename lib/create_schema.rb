require './lib/database.rb'
require 'SQLite3'

# class  TasksQuery
#   attr_reader :db

  @db = TaskList::Database.new
  @db.create_schema!
  #
  # def initialize(db_name = "tasks")
  #   @db = SQLite3::Database.new("database/#{db_name}.db")
  # end

# end
