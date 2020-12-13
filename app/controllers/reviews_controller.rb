class ReviewsController < ApplicationController
  def new
    @book = Book.find(params[:book_id])
    @review = Review.new
  end
  def create
    @book = Book.find(params[:book_id])
    @review = @book.reviews.create(params.require(:review).permit(:name, :review))
    redirect_to patron_books_path(patron_id: 1, id: @book)
  end
end
