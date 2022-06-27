class BooksController < ApplicationController
  def index
    @dissapear = params[:dissapear] if params[:dissapear].present?
    @books = Book.all
    @tags = ["Horror", "S-F", "Distopia", "Classic", "Adventure", "Fantasy"]
    # Search bar
    if params[:query].present?
      @books = Book.search_by_title_and_author(params[:query])
    elsif params[:tag].present?
      @books = Book.where("tags @> ARRAY[?]::varchar[]", [params[:tag].to_s, params[:tag].to_s])
    else
      @books = Book.all
    end
    respond_to do |format|
      format.html
      format.text { render partial: 'books/list', locals: { books: @books, user: current_user }, formats: [:html] }
    end
    @user = current_user
  end

  def show
    @book = Book.find(params[:id])
    @chatrooms = Chatroom.all
    @books_tag = Book.where("tags @> ARRAY[?]::varchar[]", [@book.tags[0].to_s, @book.tags[1].to_s])

    # Code to see all the users on map (could be usefull later)
    # user_ids = Book.all.select('user_id').pluck(:user_id).uniq
    # @users = User.where(id: user_ids)
    # geocoder works with an array so let's put the user_id in an array

    @users = User.where(id: [@book.user.id])
    @markers = @users.geocoded.map do |user|
      {
        lat: user.latitude,
        lng: user.longitude,
        image_url: helpers.asset_url("book.png")
      }
    end
  end

  def new
    @book = Book.new
  end

  def create
    @book = Book.new(book_params)
    @book.user = current_user
    @book.availability = true
    if @book.save!
      redirect_to dashboard_path, notice: 'New book was successfully added.'
    else
      render :new
    end
  end

  def edit
    @book = Book.find(params[:id])
  end

  def update
    @book = Book.find(params[:id])
    if @book.update(book_params)
      redirect_to dashboard_path, notice: 'Book was successfully updated.'
    else
      render :edit
    end
  end

  def destroy
    @book = Book.find(params[:id])
    @book.destroy

    redirect_to dashboard_url, notice: 'Book was successfully destroyed.'
  end

  private

  def book_params
    params.require(:book).permit(:title, :author, :description, :year, :photo, :tags)
  end
end
