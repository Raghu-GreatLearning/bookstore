
#Navigate to google.co.uk
Given('I am on the Bookstore homepage') do
  visit 'https://bookstore-raghu.herokuapp.com/'
end
When('I sign up') do
  click_button 'Sign Up'
  fill_in "Email", with: 'Raghu@gmail.com'
  fill_in "Password", with: '123'
  fill_in "Confirm password", with: '123'
  click_button "Sign Up"
  sleep(5)
end

Then('I visit Books page') do
  expect(page).to have_content('Email has already been taken')
end
# #Write "yahoo" search text to the search bar  
# When(/^I will search for "([^"]*)"$/) do |searchText|
#   find(:css, "input[name='q']").set(searchText)
#   click_button "Google Search"
# end
# #In the current page, we should see "yahoo" text
# Then(/^I should see "([^"]*)"$/) do |expectedText|
#   page.should have_content(expectedText)
# end
# #Click the yahoo link 
# Then(/^I will click the yahoo link$/) do
#   click_link('https://in.yahoo.com')
# end
# #Wait 5 seconds statically to see yahoo website
# Then(/^I will wait for (\d+) seconds$/) do |waitTime|
#   sleep (waitTime.to_i)
# end



# Given('I am on the Google homepage') do
#     visit 'https://www.google.com'
# end

# When('I will search for {string}') do |string|
#   pending # Write code here that turns the phrase above into concrete actions
# end

# Then('I should see {string}') do |string|
#   pending # Write code here that turns the phrase above into concrete actions
# end