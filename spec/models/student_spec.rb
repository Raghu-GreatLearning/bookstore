require 'rails_helper'

RSpec.describe Student, type: :model do
  let(:student) { build(:student) }
  describe 'schema' do
    it { should have_db_column(:email).of_type(:string) }
    it { should have_db_column(:name).of_type(:string) }
    it { should have_db_column(:bookIssued).of_type(:string) }
    it { should have_db_column(:returnDate).of_type(:date) }
    it { should have_db_column(:issuedDate).of_type(:date) }

  end

  describe 'validations' do
    it { should validate_presence_of(:email) }
    it { should validate_presence_of(:name) }
    it { should validate_presence_of(:bookIssued) }
    it { should validate_presence_of(:returnDate) }
    it { should validate_presence_of(:issuedDate) }
    # it { should validate_uniqueness_of(:email).ignoring_case_sensitivity }
    it 'should not take invalid emails' do
      expect(student).to_not allow_value('something').for(:email)
      expect(student.errors.full_messages_for(:email).to_sentence).to eq('Email is invalid')
      expect(student.errors.count).to eq(1)
    end
  end

  describe 'validating student data' do
    let(:student) {build(:student)}
    it 'issue the book successfully' do
      expect(student.save).to eq(true)
    end
  end
end
