require_relative "db_driver"

module TaskList
  class Database

    def initialize(db_name)
      @db = DBDriver.new(db_name)
    end

    def delete_schema
      @db.delete_schema
    end

    def create_schema
      # Put your ruby code here to use the @db variable
      # to setup your schema in the databas.
    end
  end
end
