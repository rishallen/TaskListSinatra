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

        @db.execute("DROP TABLE IF EXISTS tasks;")
        @db.execute(query)
    end

# {big_list => {task[a] => a, task[b] => b, task[c] => c}}

    def create_task(title, description = nil )
      @db.execute( "INSERT into tasks (title, description) values (?, ?)", title, description)
    end

    def get_tasks
      @db.execute( "SELECT title, description, id FROM tasks;" )
    end

    def add_completion(completed_at = nil)
      @db.execute( "INSERT into tasks (completed_at) values (? );", completed_at)
    end

    # the server is getting the data and displaying on the webpage
    def get_completed_tasks
      @db.execute( "SELECT title, completed_at FROM tasks;" )
    end

    def delete(deleted = nil)
      @db.execute("DELETE FROM tasks WHERE id = ?;", deleted[0].to_i)
    end

    def get_tasks_by_id(edits = nil)
      @db.execute( "SELECT title, description, id FROM tasks WHERE id = ?;", edits[0].to_i)
    end

    def edit_tasks(title, description = nil, id = nil)
      @db.execute("UPDATE tasks SET title = ?, description = ? WHERE id = ?;", title, description, id.to_i)
    end


    # insert_statement = <<-INSERTSTATEMENT
    #   INSERT INTO tasks (
    #     title, description, completed_at
    #   )
    #
    #   VALUES (
    #     :title, :description, :completed_at
    #   );
    # INSERTSTATEMENT

    # # now that we have a prepared statement...
    # # let's iterate the csv and use its values to populate our database
    # # WE DONT HAVE A CSV YET.. !!!!!!!!!!!!!!!!!!!!!!!!!
    # # CSV.foreach(FILE_PATH, headers: true) do |row|
    # #   prepared_statement.execute(row.to_h)
    # # end
    # puts "Data import complete!"

    #
    # def setup!
    #   create_schema!
    #   # load
    # end

  end
end

TaskList::Database.new.create_schema!
