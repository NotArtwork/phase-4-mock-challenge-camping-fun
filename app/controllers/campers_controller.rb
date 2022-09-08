class CampersController < ApplicationController

    def index
        campers = Camper.all
        render json: campers, only:[:id, :name, :age]
    end

    def show
        camper = Camper.find_by(id: params[:id]).to_json(methods: [:activities])
        render json: camper
    end

    def create 
        camper = Camper.new(camper_params)
        if camper.save 
                render json: camper, only:[:name, :age]
         else 
                render json: {errors: 'validation errors'}
        
        end
    end




    private

    def camper_params
        params.permit(:name, :age)
    end
end
