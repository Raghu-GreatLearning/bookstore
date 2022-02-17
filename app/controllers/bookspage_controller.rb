class BookspageController < ApplicationController
  before_action :require_user_logged_in!
  def index
    @books = Book.all
  end

  def new
    @book = Book.new
  end

  def create
    @book = Book.new(book_params)

    if @book.save
      redirect_to seeBooks_path, notice: "Successfully Added book to database"
    else
      flash[:alert] = "Fill out Book details"
      @errors = @book.errors.full_messages 
      puts @book.errors.full_messages 
      render :new, status: :unprocessable_entity
    end
  end

  private

  def book_params
    params.require(:book).permit(:title, :author, :published_in, :volume)
  end
end