env = ENV["RACK_ENV"] || "development"

require 'sinatra/base'
require_relative 'db_config'

require 'rack-flash'

class Chitter < Sinatra::Base
	set :views, File.join(File.dirname(__FILE__), '../views')
  enable :sessions
  set :session_secret, 'mixed'
  use Rack::Flash
	
  get '/' do
    'Hello Chitter!'
  end

  get '/makers/new' do
  	erb :"new_maker"
  end

  post '/makers' do
    @maker = Maker.new(name: params[:name],
                       username: params[:username],
                       email: params[:email],
                       password: params[:password],
                       password_confirmation: 
                        params[:password_confirmation])
    if @maker.save 
    else
      flash.now[:errors] = @maker.errors.full_messages
      erb :"new_maker"      
    end
  end

  get '/sessions/new' do
    erb :"new_session"
  end

  post '/sessions' do
    email, username = params[:email], params[:username]
    maker = Maker.authenticate(email, username)
    if maker
      session[:maker_id] = maker.id
      redirect '/'
    else
      flash.now[:errors] = ["Incorrect Username or Password"]
      erb :"new_session"
    end
  end

  # start the server if ruby file executed directly
  run! if app_file == $0
end
