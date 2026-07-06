class ReservationsController < ApplicationController
    before_action :authenticate_user!

    def index
        @reservations = current_user.reservations.includes(room: :images_attachments)
    end

    def new
        puts params.inspect
        puts params[:room_id]

        @room = Room.find(params[:room_id])
        @reservation = Reservation.new
    end

    def create
        @room = Room.find(params[:room_id])
        @reservation = current_user.reservations.new(reservation_params)
        @reservation.room = @room

        if @reservation.save
            redirect_to @reservation, notice:"予約を登録しました"
        else 
            render :new,status: :unprocessable_entity
        end
    end

    def show 
        @reservation = current_user.reservations.find(params[:id])
    end

    private

    def reservation_params
        params.require(:reservation).permit(:check_in_date,:check_out_date,:people)
    end
end
