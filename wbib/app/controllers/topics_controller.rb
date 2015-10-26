class TopicsController < ApplicationController

    def index
        @Topics = Topic.all { }
    end

    def show
        @topic = Topic.find(params[:id])
        @references = @topic.references
    end

    def new
    end

    def create
        newTopic = Topic.new

        newTopic.title = params[:topic][:title]
        newTopic.description = params[:topic][:description]

        if newTopic.valid? then
            newTopic.save
            flash[:notice] = "Your topic has been saved!"
            redirect_to :back
        else
            flash[:notice] = newTopic.errors.full_messages.to_sentence
            redirect_to :back
        end
    end

    def edit
        @topic = Topic.find(params[:id])
    end

    def destroy
        @topic = Topic.find(params[:id])
        @topic.destroy

        redirect_to topics_path
    end
end