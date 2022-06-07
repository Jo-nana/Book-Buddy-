class BookingsController < ApplicationController
  def new
    @booking = Booking.new
    @book = Book.find(params[:book_id])
  end

  def create
    @booking = Booking.new(booking_params)
    @booking.book = Book.find(params[:book_id])
    @booking.user = current_user
    if @booking.save
      redirect_to root_path
    else
      render :new
    end
  end

  def accept
    # @book = Book.find(params[:book_id])
    @booking = Booking.find(params[:id])
    @booking.accepted = true
    @booking.save
    @booking.book.change_availability_to_false
    redirect_to dashboard_path, notice: "Request accepted!"
  end

  def swap

      # @book = Book.find(params[:book_id])
    @booking = Booking.find(params[:booking_id])
    @booking.accepted = true
    @booking.save!
    @booking.book.change_availability_to_false

    @booking_one = Booking.new(start_date: @booking.start_date, end_date: @booking.end_date, accepted: true)
    @book_one = Book.find(params[:id])
    @booking_one.book = @book_one
    @booking_one.user = current_user
    @booking_one.save!
    @booking_one.book.change_availability_to_false
    redirect_to dashboard_path, notice: "It's a swap!"
  end


  private

  def booking_params
    params.require(:booking).permit(:start_date, :end_date, :user_id, :book_id)
  end
end
