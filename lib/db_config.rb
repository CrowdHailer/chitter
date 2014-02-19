require 'data_mapper'

env = ENV['RACK_ENV'] || "development"

DataMapper.setup(:default, "postgres://postgres:1234@localhost/chitter_#{env}")

require './lib/peep'
require './lib/maker'

DataMapper.finalize
DataMapper.auto_upgrade!