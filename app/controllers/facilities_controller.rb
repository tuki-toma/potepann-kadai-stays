class FacilitiesController < ApplicationController
    def index
        @Facilities = Facility.all
    end

    def facility_params
        params.require(:facility).permit(:neme,:introduce,:fee,:image)
    end
end
