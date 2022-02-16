require 'rails_helper'

RSpec.describe Student, type: :model do
  describe "validating student data" do
    let(:student) {build(:student)}

    it "check student name is present" do
      student.name = nil
      expect(student.save).to eq(false)
    end
    it "check student email is present" do
      student.email = nil
      expect(student.save).to eq(false)
    end

    it "check issued Book is present" do
      student.bookIssued = nil
      expect(student.save).to eq(false)
    end

    it "check issue date is present" do
      student.issuedDate = nil
      expect(student.save).to eq(false)
    end

    it "check return date is present" do
      student.returnDate = nil
      expect(student.save).to eq(false)
    end

    it "issue the book successfully" do
      expect(student.save).to eq(true)
    end
  end
end
