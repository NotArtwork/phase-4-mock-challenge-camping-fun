class SignupsController < ApplicationController

    def create
        new_signup = Signup.new(signup_params)
        render json: new_signup
    end



    private

    def signup_params 
        params.permit(:time, :camper_id, :activity_id)
    end
end
