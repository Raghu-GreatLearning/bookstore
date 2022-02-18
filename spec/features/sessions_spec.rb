require 'rails_helper'

RSpec.feature "sigIn", type: :feature do
  context 'without sign in' do
    scenario 'visit home page' do
      visit(root_path)
      expect(find('h1')).to have_content('Sign In / Sign Up as Admin')
    end
  end

  scenario 'visit sign in page' do
    visit(root_path)
    click_button "Sign In"
    expect(page).to have_content("Sign In")
  end

  scenario 'visit sign Up page' do
    visit(root_path)
    click_button "Sign Up"
    expect(page).to have_content("Sign Up")
  end

  describe 'signing in' do
    let(:user) { build(:user) }

    before :each do
      visit sign_in_path
      fill_in 'Email', with: user.email
    end

    it'should throw error' do
      click_button 'Sign In'
      expect(page).to have_content('Invalid email or password')
    end

    it'confirm sign_up Path' do
      click_button 'Sign In'
      expect(current_path).to eq(sign_in_path)
    end
    it 'sign in successfully' do
      visit sign_up_path
      fill_in 'Email', with: user.email
      fill_in 'Password', with: user.password
      fill_in 'Confirm password', with: user.confirm_password
      click_button 'Sign Up'
      expect(page).to have_content("Successfully created account")
      click_button('Logout')
      expect(page).to have_content("Logged out")
      click_link("Login")
      fill_in 'Email', with: user.email
      fill_in 'Password', with: user.password
      click_button("Sign In")
      expect(page).to have_content("Logged In Successfully")
    end

  end
end
