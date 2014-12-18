class StoriesController < ApplicationController

	def index
		@stories = Story.all
	end

	def new
		@story = Story.new
		@story.beats.build
	end

	def create
		@story = Story.new(story_params)
		         
        
        if @story.valid? and @story.save
        	
          @story.beats.create(:picture => params[:story][:picture],:story_id => @story.id)                 
		  redirect_to stories_path
		else
		  render :action => :new
		end
	end

	def show
		@story = Story.find(params[:id])
		@beats = @story.beats
	end

	def edit
		@story = Story.find(params[:id])
	end

	def update
		@story = Story.find(params[:id])

		if @story.update(story_params)
			redirect_to @story
		else
			render 'edit'
		end
	end

	def destroy
		@story = Story.find(params[:id])
		@story.destroy

		redirect_to stories_path
	end

    private
        def story_params
            params.require(:story).permit(:title, :body, :pictures, picture_attributes: [ :asset, :asset_content_type, :asset_file_name, :tempfile, :asset_file_size, :asset_updated_at, :_destroy])
        end

end
