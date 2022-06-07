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
      format.text { render partial: 'books/list', locals: { books: @books, user: current_user }, formats: [:html] }
    end
    @user = current_user
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
    @book = Book.new
  end

  def create
    @book = Book.new(book_params)
    @book.user = current_user
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
  # def calculate_distance
  #   @delta = Geocoder::Calculations.distance_between([current_user.latitude, current_user.longitude], [book.user.latitude, book.user.longitude])
  # end
end

# distance between two points (haversine formula)
# module Geocoder
#   module Calculations
#     extend self
#       def distance_between(current_user.address, book., options = {})
#         # convert to coordinate arrays
#         point1 = extract_coordinates(point1)
#         point2 = extract_coordinates(point2)

#         # convert degrees to radians
#         point1 = to_radians(point1)
#         point2 = to_radians(point2)

#         # compute deltas
#         dlat = point2[0] - point1[0]
#         dlon = point2[1] - point1[1]

#         a = (Math.sin(dlat / 2))**2 + Math.cos(point1[0]) *
#             (Math.sin(dlon / 2))**2 * Math.cos(point2[0])
#         c = 2 * Math.atan2( Math.sqrt(a), Math.sqrt(1-a))
#         c * earth_radius(options[:units])
#       end
#     end
#   end
# end
