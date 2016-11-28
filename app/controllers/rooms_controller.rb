class RoomsController < ApplicationController
  def new
    if request.referrer.split("/").last == "chatrooms"
      flash[:notice] = nil
    end
    @room = Room.new
  end

  def create
    @room = Room.new(room_params)
    @room.user = current_user
    if @room.save
      respond_to do |format|
        format.html { redirect_to @room }
        format.js
      end
    else
      respond_to do |format|
        flash[:notice] = {error: ["a room with this title already exists"]}
        format.html { redirect_to new_room_path }
        format.js { render template: 'rooms/room_error.js.erb'} 
      end
    end
  end

  def index
    @room = Room.new
    @rooms = Room.all
  end

  def show
    @room = Room.find_by(name: params[:name])
    @message = Message.new
  end

  private

    def room_params
      params.require(:room).permit(:title)
    end

end
