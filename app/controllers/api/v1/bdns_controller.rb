class Api::V1::BdnsController < ApplicationController
    def index
        @bdns = Bdn.all    
        render json: @bdns, status: :ok
    end

    def show
        @bdn = Bdn.find(params[:id])
        render json: @bdn, status: :ok    
    end
end
