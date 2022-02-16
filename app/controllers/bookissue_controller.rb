class BookissueController < ApplicationController
  def new
    @book = Book.find(params[:id])
    @book2 = Book.new
  end
  
  def show
    @book = Book.find(params[:id])
  end
end