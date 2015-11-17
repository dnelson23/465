class TagsController < ApplicationController

    # AJAX call to controller
    def create
        tag = Tag.new
        tag.str = params[:tag_str]
        tag.image_id = params[:image_id]
        
        if tag.valid?
            tag.save
            flash[:info] = "New tag successfully added"
        else
            flash[:danger] = tag.errors.full_messages.to_sentence
        end

        redirect_to :back
    end

    def destroy
        tag = Tag.find(params[:tags])
        tag.destroy

        flash[:info] = "Tag successfully deleted"
        redirect_to :back
    end
end
