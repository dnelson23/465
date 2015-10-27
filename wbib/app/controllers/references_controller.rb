class ReferencesController < ApplicationController
    def show
        @reference = Reference.find(params[:id])
    end

    def new
        @topic = Topic.find(params[:topic_id])
    end

    def create
        newReference = Reference.new

        newReference.url = params[:reference][:url]
        newReference.topic_id = params[:topic_id]

        if newReference.valid? then
            newReference.save
            flash[:info] = "Your reference has been saved!"
            redirect_to :back
        else
            flash[:danger] = newReference.errors.full_messages.to_sentence
            redirect_to :back
        end
    end

    def destroy
        @reference = Reference.find(params[:id])
        @reference.destroy

        redirect_to topic_path(params[:topic_id])
    end
end