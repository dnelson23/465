class SmashersController < ApplicationController

    def index
        @smashers = Smasher.all
    end

    def create
    end

    def new
    end

    def show
        @smasher = Smasher.find(params[:id])
    end

    def update
    end

    def destroy
    end

    def doesExist
        smasher = Smasher.find_by(tag: params[:tag])
        respond_to do |format|
            format.js {}
            format.json {
                if smasher != nil
                    render json:  { "does_exist" => "true" }
                else
                    render json: { "does_exist" => "false" }
                end
            }
        end
    end
end