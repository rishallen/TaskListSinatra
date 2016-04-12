require 'sinatra'
require_relative 'lib/database.rb'
require_relative 'lib/create_schema.rb'
# require_relative 'lib/query.rb'

class TaskInput < Sinatra::Base
  # @tasks = TaskList::Database.new.create_schema!

  def current_database
    @current_db ||= TaskList::Database.new
  end

  get '/' do
    @tasks = current_database.get_tasks
    erb :index
  end

  get '/task-form' do
    erb :'task-form'
  end

  post '/task-form' do
    current_database.create_task(params[:task_list][:title], params[:task_list][:description])
    erb :index
  end

    run!
end
