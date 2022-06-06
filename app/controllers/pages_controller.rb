class PagesController < ApplicationController
  # before_action :authenticate_user!, only: [ :home, :component ]


  def home
  end

  def component
  end

  def dashboard
    @user = current_user
    @user_full_name = @user.full_name
    @user.books
    @owner_bookings = []
    @user.books.each do |book|
      @owner_bookings << book.bookings unless book.bookings.empty?
    end
    @owner_bookings = @owner_bookings.flatten
  end
end
