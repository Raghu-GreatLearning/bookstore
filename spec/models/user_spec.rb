require 'rails_helper'

RSpec.describe User, type: :model do
  describe 'validation tests using static' do
    let(:user) { build(:user) }

    it "check email is present" do
      user.email = nil
      expect(user.save).to eq(false)
    end

    it "check password is present" do
      user.password = nil
      expect(user.save).to eq(false)
    end

    it "check confirm password is present" do
      user.confirm_password = nil
      expect(user.save).to eq(false)
    end

    it "check password and confirpassword are same" do
      expect(user.password).to eq(user.confirm_password)
    end
  end
end
