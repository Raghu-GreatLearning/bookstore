class Book < ApplicationRecord
  validates :title, presence: true, uniqueness: true
  validates :author, presence: true
  validates :published_in, presence: true
  validates :volume, presence: true
  has_many :issued_books
  has_many :students, through: :issued_books

  def self.check_issue_status(title)
    @book = Book.find_by(title: title)
    @book.students.present?
  end


  def self.update_book(params,student)
    @book = Book.find_by(title: params[:book_issued])
    puts(@book)
    puts "************"
    @book.students << student
    puts(@book.issued_books.first)
    issued_book_record= @book.issued_books.first 
    issued_book_record.issued = true
    issued_book_record.issued_date = params[:issued_date].to_s
    issued_book_record.return_Date = params[:issued_date].to_s
    issued_book_record.save

  end

  def self.book_returned(params)
    @book = Book.find(params[:id])
    @book.issued_books.destroy_all
    @book.students.destroy_all

  end
end
