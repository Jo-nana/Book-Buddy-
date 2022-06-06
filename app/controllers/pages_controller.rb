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
  end
end
