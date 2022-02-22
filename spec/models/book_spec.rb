require 'rails_helper'

RSpec.describe Book, type: :model do
  let(:book) {create(:book)} 
  let(:student) {create(:student)}
  let(:my_book) {build(:book)} 
  
  describe 'schema' do
    it { should have_db_column(:title).of_type(:string) }
    it { should have_db_column(:author).of_type(:string) }
    it { should have_db_column(:published_in).of_type(:integer) }
    it { should have_db_column(:volume).of_type(:integer) }
    
  end
  
  describe 'validations' do
    it { should validate_presence_of(:title) }
    it { should validate_presence_of(:author) }
    it { should validate_presence_of(:published_in) }
    it { should validate_presence_of(:volume) }
    it { should validate_uniqueness_of(:title).ignoring_case_sensitivity }
    
  end
  
  describe 'checking methods' do
    it 'check_issue_status ' do
      expect{ Book.check_issue_status}.to raise_error(ArgumentError)
    end

    it 'checck update_book' do
      expect{ Book.update_book}.to raise_error(ArgumentError)
    end

    it 'check returned_book' do
      expect{ Book.book_returned}.to raise_error(ArgumentError)
    end
  end


  describe 'create' do
    it { expect { my_book.save}.to change(Book, :count).by(1) }
  end
  
  it 'give error on Adding Book' do
    my_book.title = nil
    expect(my_book.save).to eq(false)  
  end


  describe 'vaidating book data' do
    it 'vaidate that book is not issued' do
      @book = book
      expect(Book.check_issue_status(student)).to eq(false)
    end

    it 'vaidate if book is issued can\'t issue it again' do
      @book = book
      @book[:issued] = true
      @book.save
      expect(Book.check_issue_status(student)).to eq(true)
    end

    it 'update book status after issuing it' do
      @book =book
      Book.update_book(student)
      expect(Book.check_issue_status(student)).to eq(true)
    end

    it 'Check book is returned after book is returned' do
      @book = book
      Book.update_book(student)
      expect(Book.check_issue_status(student)).to eq(true)
      Book.book_returned(@book)
      expect(Book.check_issue_status(student)).to eq(false)
    end
  end
end
