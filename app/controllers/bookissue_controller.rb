class BookissueController < ApplicationController
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

    if Book.checkIssueStatus(@student)
      redirect_to seeBooks_path, alert: "Book Already issued"
    elsif @student.save
      Book.updateBook(@student)
      redirect_to seeBooks_path, notice: "Book Issued"
    else
      # flash[:alert] = "Something went worng" 
      @errors = @student.errors.full_messages
      # render :new, status: :unprocessable_entity
      redirect_to seeBooks_path, alert: "Students details are not available"
    end
  end

  def return
    Book.bookReturned(params)
    redirect_to seeBooks_path, notice: "Book Returned"
  end

  private

  def student_params
    params.require(:student).permit(:name, :email, :bookIssued, :issuedDate, :returnDate)
  end
end