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
      redirect_to dashboard_path
    else
      render :new
    end
  end

  def accept
    @booking = Booking.find(params[:id])
    @booking.accepted = true
    @booking.save
    @booking.book.change_availability_to_false
    chat = Chatroom.create!(user: @booking.user, book: @booking.book, name: " #  #{rand(1..100).to_s}", bookclub: false)
    Message.create!(content: "Thanks for accepting my request", chatroom: chat, user: @booking.user)
    redirect_to chatroom_path(chat), notice: "Request accepted!"
  end

  def swap
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
    chat = Chatroom.create!(user: @booking.user, book: @booking.book, name: " #  #{rand(1..100).to_s}", bookclub: false)
    Message.create!(content: "Thanks for accepting the swap!", chatroom: chat, user: @booking.user)
    redirect_to chatroom_path(chat), notice: "It's a swap!"
  end

  private

  def booking_params
    params.require(:booking).permit(:start_date, :end_date, :user_id, :book_id)
  end
end
