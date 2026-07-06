class RoomsController < ApplicationController
    before_action :authenticate_user! , except:[:search,:show]
    before_action :set_q,only:[:search]

    def index
        @rooms = current_user.rooms
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

    def search
        if params[:q].present?
            @rooms = @q.result
        else
            @rooms = []
        end
    end

    private

    def set_q
        @q = Room.ransack(params[:q])
    end

    def room_params
        params.require(:room).permit(:name,:introduce,:price,:address,:area_id,images:[])
    end
end