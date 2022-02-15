class BookissueController < ApplicationController
  def new
    @book = Book.find(params[:id])
    @book2 = Book.new
  end
end