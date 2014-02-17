Then(/^I should be added as a chitter user$/) do
  expect(Maker.count).to eq(1)
end