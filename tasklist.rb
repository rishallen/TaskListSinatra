require 'sinatra'
require_relative 'lib/database.rb'
require_relative 'lib/create_schema.rb'
require 'date'

# require_relative 'lib/query.rb'

class TaskInput < Sinatra::Base

  helpers do
    def active_page?(path='')
      request.path_info == '/' + path
    end
  end
  
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
    current_database.delete(params[:deleted])
    # erb :index
    redirect '/'
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

  post '/update' do
    current_database.edit_tasks(params[:task_list][:title], params[:task_list][:description], params[:task_list][:id])
    redirect '/'
  end

  post '/edit' do
    @edittasks = current_database.get_tasks_by_id(params[:edits])
    erb :edit
  end

    run!
end
