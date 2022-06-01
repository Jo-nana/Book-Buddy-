class BooksController < ApplicationController
  def index
    @books = Book.all
    @tags = ["Horror", "S-F", "Distopia", "Classic", "Adventure", "Fantasy"]

    # search bar

    if params[:query].present?
      @books = Book.search_by_title_and_author(params[:query])
    elsif params[:tag].present?
      # @books = Book.where("'#{params[:tag]}' = ANY (tags)")
      @books = Book.where("tags @> ARRAY[?]::varchar[]", ["#{params[:tag]}", "#{params[:tag]}"])
    else
      @books = Book.all
    end
    respond_to do |format|
      format.html
      format.text { render partial: 'books/list', locals: { books: @books }, formats: [:html] }
    end
  end

  def show
    @book = Book.find(params[:id])
    @chatrooms = Chatroom.all

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
