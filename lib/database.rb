require "sqlite3"

module TaskList
  class Database

    def initialize(db_name = "tasks")
      @db = SQLite3::Database.new("database/#{db_name}.db")
    end

    def create_schema!
      # Put your ruby code here to use the @db variable
      # to setup your schema in the database.
      query = <<-CREATESSTATEMENT
        CREATE TABLE tasks (
          id INTEGER PRIMARY KEY,
          title TEXT NOT NULL,
          description TEXT,
          completed_at TEXT
        );
        CREATESSTATEMENT

        db.execute("DROP TABLE IF EXISTS tasks;")
        db.execute(query)
    end
  end
end

Database.new.create_schema!
