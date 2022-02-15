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
      visit signIn_path
      fill_in 'Email', with: user.email
    end

    it'should throw error' do
      click_button 'Sign In'
      expect(page).to have_content('Invalid email or password')
    end

    it'confirm SignUp Path' do
      click_button 'Sign In'
      expect(current_path).to eq(signIn_path)
    end

  end
end
