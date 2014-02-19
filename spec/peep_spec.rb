require 'spec_helper'

describe Peep do
	context 'demonstration of how datamapper works' do
		it 'should be created and then retrieved from the database' do
			expect(Peep.count).to eq(0)
			Peep.create({:body => "This was an exiting first peep", 
                  :user => "McMan"})
			expect(Peep.count).to eq(1)
			peep = Peep.first
			expect(peep.body).to eq("This was an exiting first peep")
			expect(peep.user).to eq("McMan")
			peep.destroy
			expect(Peep.count).to eq(0)
		end
	end
end