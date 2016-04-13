require 'SQLite3'

class  TasksQuery
  attr_reader :db

  def initialize(db_name = "tasks")
    @db = SQLite3::Database.new("database/#{db_name}.db")
  end

  def taskrecord(row)
    db.execute( "INSERT into tasks values (a = :title, b = :description, c = :completed_at )", *bind_vars )
    # hash_of_hashes.each do |key, value_array|
      # :title => value_array[0]
      # :description => value_array[1]
      # :completed_at => value_array[2]
    #end
  end



end
