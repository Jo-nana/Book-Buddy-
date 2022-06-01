class ChatroomsController < ApplicationController
  def index
    @chatrooms = Chatroom.all
  end

  def show
  end

  def new
  end

  def create
  end
end
