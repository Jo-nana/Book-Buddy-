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

  private

  def booking_params
    params.require(:booking).permit(:start_date, :end_date, :user_id, :book_id)
  end
end
