env = ENV["RACK_ENV"] || "development"

require 'sinatra/base'
require_relative 'db_config'

class Chitter < Sinatra::Base
	set :views, File.join(File.dirname(__FILE__), '../views')
	
  get '/' do
    'Hello Chitter!'
  end

  get '/makers/new' do
  	erb :"new_maker"
  end

  # start the server if ruby file executed directly
  run! if app_file == $0
end
