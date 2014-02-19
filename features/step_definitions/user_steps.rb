Then(/^I should be added as a chitter user$/) do
  expect(Maker.first(:name => "Peter").username).to eq("Pickleaddict")
end

Then(/^I should not be added as a chitter user$/) do
  expect(Maker.first(:name => "Peter")).to be_nil
end