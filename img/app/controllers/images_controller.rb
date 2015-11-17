class ImagesController < ApplicationController
    def new
    end

    def create
        @image = Image.new
        @uploaded_io = params[:image][:uploaded_file]
        @image.filename = generate_filename @uploaded_io.original_filename
        @image.user_id = current_user.id

        if params[:image][:private] == 1
            @image.private = true
        else
            @image.private = false
        end

        File.open(Rails.root.join('public', 'images', @image.filename), 'wb') do |file|
            file.write(@uploaded_io.read)
        end

        if @image.save
          redirect_to @image, notice: 'Image was successfully created.'
        else
            flash[:danger] = @image.errors.full_messages.to_sentence
          render :new
        end
    end

    def show
        @image = Image.find(params[:id])
        @tags = @image.tags
        @users = @image.users
        @allUsers = User.all
    end

    def update
        image = Image.find(params[:id])
        image.private = params[:image_private]
        image.save

        flash[:info] = "Image privacy updated";
        redirect_to :back
    end

    def destroy
    end

    def generate_filename(filename)
        return Digest::SHA1.hexdigest filename
    end

end