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
            flash[:info] = "Your topic has been saved!"
            redirect_to :back
        else
            flash[:danger] = newTopic.errors.full_messages.to_sentence
            redirect_to :back
        end
    end

    def edit
        @topic = Topic.find(params[:id])
    end

    def update
        topic = Topic.find(params[:id])

        topic.title = params[:topic][:title]
        topic.description = params[:topic][:description]

        if topic.valid? then
            topic.save
            flash[:info] = "Your topic has been saved"
            redirect_to :root
        else
            flash[:danger] = topic.errors.full_messages.to_sentence
            redirect_to :back
        end
    end

    def destroy
        @topic = Topic.find(params[:id])
        @topic.destroy

        redirect_to topics_path
    end
end