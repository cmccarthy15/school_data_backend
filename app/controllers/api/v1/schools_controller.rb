class Api::V1::SchoolsController < ApplicationController

    def index
        @schools = School.all    
        # add pagination
        # also allow for indexing by address and getting the closest
        # put a method on the model for that?
        render json: @schools, status: :ok
    end

    def show
        @school = School.find(params[:id])
        render json: @school, status: :ok    
    end

    # def create
    #     @school = School.create({
         
    #     })
    
    #     if @school.save
    #       render json: @school, status: :ok
    #     else
    #       render json: {errors: @school.errors.full_messages[0]}
    #     end
    # end
    
    # def update
    #   @school = School.find(params[:id])

    #   if params[:url]
    #   end

    #   if @school.save
    #     render json: @school, status: :ok
    #   else
    #     render json: {errors: @school.errors.full_messages[0]}
    #   end
    # end
end
