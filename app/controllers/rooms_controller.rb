class RoomsController < ApplicationController
    before_action :authenticate_user!

    def index
        @rooms = Room.all
    end

    def new 
        @room = Room.new
    end 

    def create
        @room = current_user.rooms.new(room_params)

        if @room.save
            redirect_to @room, notice: "宿泊施設を登録しました"
        else
            render :new,status: :unprocessable_entity
        end
    end

    def show
        @room = Room.find(params[:id])
    end

    private

    def room_params
        params.require(:room).permit(:name,:introduce,:price,:address,images:[])
    end
end
