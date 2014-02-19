class Peep
	include DataMapper::Resource

	property :is, Serial
	property :body, Text
	property :user, String
	
end