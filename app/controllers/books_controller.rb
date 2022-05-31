class BooksController < ApplicationController
  def index
    @books = Book.all

    # search bar

    if params[:query].present?
      @books = Book.search_by_title_and_author(params[:query])
    elsif params[:tag].present?
      @books = Book.where("'#{params[:tag]}' = ANY (tags)")
    else
      @books = Book.all
    end
    @search_by_tags = Book.where(tags: params[:query])
    # link to with where tags = paramsquery

    @tags = ["Horror", "S-F", "Distopia", "Classic", "Adventure", "Fantasy"]
  end

  def show
    @book = Book.find(params[:id])
  end

  def new
  end

  def create
  end

  def edit
  end

  def update
  end

  def destroy
  end
end
