class BooksController < ApplicationController
  def index

    if params[:dissapear].present?
      @dissapear = params[:dissapear]
    end
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
    @books_tag = Book.where("tags @> ARRAY[?]::varchar[]", ["#{@book.tags[0]}", "#{@book.tags[1]}"])

    # code to see all the users on map (could be usefull later)

    # user_ids = Book.all.select('user_id').pluck(:user_id).uniq
    # @users = User.where(id: user_ids)

    # geocoder works with an array so let's put the user_id in an array

    @users = User.where(id: [@book.user.id])
    @markers = @users.geocoded.map do |user|
      {
        lat: user.latitude,
        lng: user.longitude,
        # info_window: render_to_string(partial: "info_window", locals: { flat: flat }),
        image_url: helpers.asset_url("book.png")
      }
    end
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
