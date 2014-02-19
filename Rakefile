require 'data_mapper'
require './lib/db_config'

task :auto_upgrade do
  DataMapper.auto_upgrade!
  puts "Auto-upgrade complete. No data has been lost."
end

task :auto_migrate do
  DataMapper.auto_migrate!
  puts "Auto-migrate complete. Data may have been lost."
end
