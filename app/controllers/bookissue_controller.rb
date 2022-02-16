class BookissueController < ApplicationController
  def new
    @book = Book.find(params[:id])
    @student = Student.new
  end

  def show
    @book = Book.find(params[:id])
  end

  def create
    @student = Student.new(student_params)

    if @student.save
      @book = Book.find_by(title: @student[:bookIssued])
      @book[:issued] = true
      @book[:issuedTo] = @student[:name]
      @book[:issuedDate] = @student[:issuedDate].to_s
      @book[:returnDate] = @student[:returnDate].to_s
      @book.save
      redirect_to seeBooks_path, notice: "Book Issued"
    else
      flash[:alert] = "Something went worng"
      @errors = @student.errors.full_messages 
      puts @student.errors.full_messages 
      render :new, status: :unprocessable_entity
    end
  end

  def return
    @book = Book.find(params[:id])
    @book[:issued] = false

    @student = Student.find_by(name: @book[:issuedTo])
    @student.destroy
    @book.save
    redirect_to seeBooks_path, notice: "Book Returned"
  end

  private

  def student_params
    params.require(:student).permit(:name, :email, :bookIssued, :issuedDate, :returnDate)
  end
end