require 'spec_helper'

describe Maker do
	let(:password) { 's3cr3t' }
	let(:maker) { Maker.new }

	it 'cyphers the password' do

		expect(BCrypt::Password).to receive(:create).with(password)

		maker.password= password
	end

	it 'sets the password digest' do	
		maker.password= password
		expect(maker.password_digest).not_to be_nil
	end

	it 'does not authenticate when it does not find the maker' do
		expect(Maker).to receive(:first).and_return(nil)

		Maker.authenticate('','')
	end

	it 'authenticates' do
		email = 'me@there.com'
		maker.password= password
		expect(Maker).to receive(:first).with(email: email).and_return(maker)
		expect(Maker.authenticate(email,password)).to eq maker
	end
end