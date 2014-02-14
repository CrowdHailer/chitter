require 'sinatra/base'

class Server < Sinatra::Base
	get '/' do
		"Hello from Chitter!!"
	end
end