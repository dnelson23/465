class ImageUsersController < ApplicationController
    def create
        iUser = ImageUser.new
        iUser.image_id = params[:image_id]
        iUser.user_id = params[:new_image_users]

        iUser.save
        flash[:info] = "User added to image"
        redirect_to :back
    end

    def destroy
        iUser = ImageUser.where("image_id = ? AND user_id = ?", params[:id], params[:image_users])
        iUser.destroy_all

        flash[:info] = "User deleted from image successfully"
        redirect_to :back
    end
end