class ActivitiesController < ApplicationController


    def index
        activities = Activity.all
        render json: activities, only:[:id, :name, :difficulty]
    end




    def destroy
        activity = Activity.find_by(id: params[:id])
        activity.signups.destroy_all
        activity.destroy
        render json: {message: 'Activity deleted'}
    end
end
