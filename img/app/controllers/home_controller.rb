class HomeController < ApplicationController
    def index
        @images = Image.all
    end

    def dashboard
        @images = current_user.images
    end
end