class FacilitiesController < ApplicationController
    def index
        @facilities = Facility.all
    end

    def new 
        @facility = Facility.new
    end 

    def create
        @facility = Facility.new(facility_params)

        if @facility.save
            redirect_to @facility, notice: "宿泊施設を登録しました"
        else
            p @facility.errors.full_messages
            render :new,status: :unprocessable_entity
        end
    end

    def show
        @facility = Facility.find(params[:id])
    end

    private

    def facility_params
        params.require(:facility).permit(:name,:introduce,:fee,:address)
    end
end
