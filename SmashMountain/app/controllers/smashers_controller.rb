class SmashersController < ApplicationController
    
    def create
    end

    def new
    end

    def show
        smasher = Smasher.find(params[:id])
    end

    def update
    end

    def destroy
    end

end