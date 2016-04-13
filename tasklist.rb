require 'sinatra'
require_relative 'lib/database.rb'
require_relative 'lib/create_schema.rb'
# require_relative 'lib/query.rb'

class TaskInput < Sinatra::Base
  # @tasks = TaskList::Database.new.create_schema!

  def current_database
    @current_db ||= TaskList::Database.new
  end

  # Step 5: Browser makes a separate request for the homepage
  get '/' do
    @tasks = current_database.get_tasks
    erb :index
  end

  post '/' do
    erb :index
  end

  # Step 1: Browser asks for the form
  get '/task-form' do
    erb :'task-form'
  end

  # Step 2: Browser submits the form with data (which we get in params)
  post '/task-form' do
    # Step 3: We save that data into the DB
    current_database.create_task(params[:task_list][:title], params[:task_list][:description])

    # Step 4: We tell the browser that it should go to the homepage
    redirect '/'
  end

  # post '/index' do
  #   @tasks = current_database.get_tasks
  #   erb :index
  # end

    run!
end
