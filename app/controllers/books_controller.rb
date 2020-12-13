class BooksController < ApplicationController
  def new
    @book = Book.new
  end

  def index
    if params[:administrator_id]
      @admin = 1
    end
  end

  def create
    @book = Book.new(params.require(:book).permit(:title, :author, :ISBN, :copies))
    if @book.save
      redirect_to @book
    else
      render 'new'
    end
  end

  def show
    @book = Book.find(params[:id])
  end

  def edit
    @book = Book.find(params[:id])
  end

  def update
    @book = Book.find(params[:id])
      if @book.update(params.require(:book).permit(:title, :author, :ISBN, :copies))
        @admin = 1
        redirect_to administrator_books_path(administrator_id: 1, id: params[:id])
      else
        render 'edit'
      end
    end
end
