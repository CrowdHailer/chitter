Then(/^I am added as a chitter user$/) do
  expect(User.count).to eq(1)
end