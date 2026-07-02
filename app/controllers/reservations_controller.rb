class ReservationsController < ApplicationController
    before_action :authenticate_user!

    def index
        @reservations = current_user.reservations.includes(room: :images_attachments)
    end

    def new
        @room = Room.find(params[:room_id])
        @reservation = Reservation.new
    end

    def create
        @reservation = current_user.reservations.new(reservation_params)

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
        params.require(:reservation).permit(:check_in_date,:check_out_date,:people,:room_id)
    end
end
