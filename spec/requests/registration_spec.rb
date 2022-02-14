require 'rails_helper'

RSpec.describe "Registrations", type: :request do
  describe "Registration request check" do
    let(:user) { build(:user) }

    it "returns http success for get signUp path" do
      get signUp_path
      expect(response).to have_http_status(:success)
    end
  end
end
