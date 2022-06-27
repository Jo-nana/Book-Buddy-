class PagesController < ApplicationController
  def dashboard
    @user = current_user
    @user_full_name = @user.full_name
    @user.books
    @owner_bookings = []

    @user.books.each do |book|
      @owner_bookings << book.bookings unless book.bookings.empty?
    end

    @owner_bookings = @owner_bookings.flatten
    @bookings = Booking.all
    @owner_pending_bookings = (@owner_bookings.select do |booking|
      booking.accepted == false
    end)

    @pending_bookings = []
    @user.books.each do |book|
      unless book.bookings.empty?
        book.bookings.each do |booking|
          @pending_bookings << booking if booking.accepted.nil?
        end
      end
    end
  end

  def cancel_booking
    @booking = Booking.find(params[:id])
    @booking.update(accepted: false)
    redirect_to dashboard_url, notice: 'Booking was cancelled.'
  end
end
