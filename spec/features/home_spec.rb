require 'rails_helper'

RSpec.feature "Homes", :type => :feature do
  context 'without sign in' do
    scenario 'visit home page' do
      visit(root_path)
      expect(find('h1')).to have_content('Sign In / Sign Up as Admin')
    end
  end

  describe 'signing up' do
    let(:user) { build(:user) }

    before :each do
      visit signUp_path
      fill_in 'Email', with: user.email
      fill_in 'Password', with: user.password
    end

    it'should throw error' do
      click_button 'Sign Up'
      expect(page).to have_content('Confirm password can\'t be blank')
    end

    it'confirm SignUp Path' do
      click_button 'Sign Up'
      expect(current_path).to eq(signUp_path)
    end

    it 'does sign up successfully' do
      fill_in 'Password confirmation', with: user.confirm_password
      click_button 'Sign Up'
      expect(page).to have_content("Password")
    end
  end
end
