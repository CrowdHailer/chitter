env = ENV["RACK_ENV"] || "development"

require 'data_mapper'
DataMapper.setup(:default, "postgres://postgres:1234@localhost/chitter_#{env}")

require './lib/peep'

DataMapper.finalize
DataMapper.auto_upgrade!

require 'sinatra/base'

class Chitter < Sinatra::Base
  get '/' do
    'Hello Chitter!'
  end

  # start the server if ruby file executed directly
  run! if app_file == $0
end
