class BookIssueController < ApplicationController
  before_action :require_user_logged_in!
  def new
    @book = Book.find(params[:id])
    @student = Student.new
  end

  def show
    @book = Book.find(params[:id])
  end
  
  def create
    @student = Student.new(student_params)
    puts params[:id]
    if Book.check_issue_status(@student)
      redirect_to see_books_path, alert: "Book Already issued"
    elsif @student.save
      Book.update_book(@student)
      redirect_to see_books_path, notice: "Book Issued"
    else
      # render :new, status: :unprocessable_entity, id: params[:id]

      redirect_to issue_book_url(id: params[:id]), alert: "Students details are not available"
    end
  end

  def return
    Book.book_returned(params)
    redirect_to see_books_path, notice: "Book Returned"
  end

  private

  def student_params
    params.require(:student).permit(:name, :email, :bookIssued, :issuedDate, :returnDate)
  end
end