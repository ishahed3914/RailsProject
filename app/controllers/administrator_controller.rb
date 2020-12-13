class AdministratorController < ApplicationController
  def index
    @author = 5
  end

  def authors
    if params[:query_author].present?
      @query = "#{params[:query_author]}"
      @books = Book.where('author LIKE :search', search:@query)
    end
  end

  def titles
    if params[:query_title].present?
      @query = "#{params[:query_title]}"
      @books = Book.where('title LIKE :search', search:@query)
    end
  end

  def isbns
    if params[:query_isbn].present?
      @query = "#{params[:query_isbn]}"
      @books = Book.where('ISBN LIKE :search', search:@query)
    end
  end

  def checkout
    @book = Book.find(params[:id])
      if @book.copies > 0
        @new_copies = @book.copies - 1
        @book.copies = @new_copies
        @book.save
        redirect_to administrator_books_path(administrator_id: 1, id: 1)
      else
        render plain: 'error'
        redirect_to administrator_books_path(administrator_id: 1, id: 1)
      end
    end
  end
