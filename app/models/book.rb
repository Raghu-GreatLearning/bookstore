class Book < ApplicationRecord
  validates :title, presence: true
  validates :author, presence: true
  validates :published_in, presence: true
  validates :volume, presence: true


  def self.check_issue_status(student)
    @book = Book.find_by(title: student[:bookIssued])
    @book[:issued]
  end

  def self.update_book(student)
    @book = Book.find_by(title: student[:bookIssued])
    @book[:issued] = true
    @book[:issuedTo] = student[:name]
    @book[:issuedDate] = student[:issuedDate].to_s
    @book[:returnDate] = student[:returnDate].to_s
    @book.save
  end

  def self.book_returned(params)
    @book = Book.find(params[:id])
    @book[:issued] =false
    @student = Student.find_by(name: @book[:issuedTo])
    @book[:issuedTo] = "return"
    @student.destroy
    @book.save
  end
end
