require 'rails_helper'

RSpec.describe Book, type: :model do
  let(:book) {build(:book)}

  describe 'vaidating book data' do

    it 'validates book title' do
      book.title = nil
      expect(book.save).to eq(false)
    end

    it 'validates book author is present' do
      book.author = nil
      expect(book.save).to eq(false)
    end

    it 'validates books published year is present' do
      book.published_in = nil
      expect(book.save).to eq(false)
    end

    it 'validates book volume number is present' do
      book.volume = nil
      expect(book.save).to eq(false)
    end

    it "vaidate that book is not issued" do
      student = Student.create({name: "raghu", email: "raghu@gmail.com", bookIssued: "harry potter", issuedDate:"2022-02-17", returnDate:"2022-02-19"})
      @book = Book.create({title: "harry potter", author: "jk", volume: 1, published_in: 2005})
    
      expect(Book.check_issue_status(student)).to eq(false)
    end

    it "vaidate if book is issued can't issue it again" do
      student = Student.create({name: "raghu", email: "raghu@gmail.com", bookIssued: "harry potter", issuedDate:"2022-02-17", returnDate:"2022-02-19"})
      @book = Book.create({title: "harry potter", author: "jk", volume: 1, published_in: 2005, issued: true})
      expect(Book.check_issue_status(student)).to eq(true)
    end

    it "update book status after issuing it" do
      student = Student.create({name: "raghu", email: "raghu@gmail.com", bookIssued: "harry potter", issuedDate:"2022-02-17", returnDate:"2022-02-19"})
      Book.create({title: "harry potter", author: "jk", volume: 1, published_in: 2005})
      Book.update_book(student)
      expect(Book.check_issue_status(student)).to eq(true)
    end

    it "Check book is returned after book is returned" do
      student = Student.create({name: "raghu", email: "raghu@gmail.com", bookIssued: "harry potter", issuedDate:"2022-02-17", returnDate:"2022-02-19"})
      @book = Book.create({title: "harry potter", author: "jk", volume: 1, published_in: 2005})
      Book.update_book(student)
      expect(Book.check_issue_status(student)).to eq(true)
      Book.book_returned(@book)
      expect(Book.check_issue_status(student)).to eq(false)

    end
  end
end
