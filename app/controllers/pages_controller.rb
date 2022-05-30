class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: [ :home, :component ]

  def home
  end

  def component
  end
end
