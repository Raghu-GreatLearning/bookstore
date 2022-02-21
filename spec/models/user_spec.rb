require 'rails_helper'

RSpec.describe User, type: :model do
  let(:user) { build(:user) }

  describe 'schema' do
    it { should have_db_column(:email).of_type(:string) }
    it { should have_db_column(:password).of_type(:string) }
    it { should have_db_column(:confirm_password).of_type(:string) }

  end

  describe "check prsesence of email, password and confirm password" do
    it { should validate_presence_of(:email) }
    it { should validate_presence_of(:password) }
    it { should validate_presence_of(:confirm_password) }

  end

  describe 'validation tests using static' do
    it "check password and confirpassword are same" do
      expect(user.password).to eq(user.confirm_password)
    end
  end
end
