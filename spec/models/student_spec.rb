require 'rails_helper'

RSpec.describe Student, type: :model do

  describe 'schema' do
    it { should have_db_column(:email).of_type(:string) }
    it { should have_db_column(:name).of_type(:string) }
    it { should have_db_column(:bookIssued).of_type(:string) }
    it { should have_db_column(:returnDate).of_type(:date) }
    it { should have_db_column(:issuedDate).of_type(:date) }

  end

  describe "validations" do
    it { should validate_presence_of(:email) }
    it { should validate_presence_of(:name) }
    it { should validate_presence_of(:bookIssued) }
    it { should validate_presence_of(:returnDate) }
    it { should validate_presence_of(:issuedDate) }

  end

  describe "validating student data" do
    let(:student) {build(:student)}
    it "issue the book successfully" do
      expect(student.save).to eq(true)
    end
  end
end
