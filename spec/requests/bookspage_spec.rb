require 'rails_helper'

RSpec.describe "Books page", type: :request do
  describe "Books page request check" do
    let(:book) { build(:book) }

    it "returns http success for get add book path" do
      get addBook_path
      # expect(response).to have_http_status(:success)
      expect(response).to redirect_to(signIn_path)

    end

    it "returns http success for post add request" do
      post addBook_path, :params => {:book => { :title => book.title, :author => book.author, :volume => book.volume, :published_in => book.published_in}}
      # expect(response).to redirect_to(seeBooks_path)
      expect(response).to redirect_to(signIn_path)

    end
  end
end
