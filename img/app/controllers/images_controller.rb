class ImagesController < ApplicationController
    def new
    end

    def create
        @image = Image.new
        @uploaded_io = params[:image][:uploaded_file]
        @image.filename = generate_filename @uploaded_io.original_filename
        @image.user = current_user

        if params[:image][:is_private] == 1
            @image.is_private = true
        else
            @image.is_private = false
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
    end

    def destroy
    end

    def generate_filename(filename)
        return Digest::SHA1.hexdigest filename
    end

end