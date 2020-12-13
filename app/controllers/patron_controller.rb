class PatronController < ApplicationController
  def index
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
end
