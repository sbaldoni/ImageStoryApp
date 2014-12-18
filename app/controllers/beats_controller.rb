class BeatsController < ApplicationController

	def index
		@story = Story.find(params[:story_id])
		@beats = @story.beats
	end

	def show
		@beat = Beat.find(params[:id])
	end

	def new
		@story = Story.find(params[:story_id])
		@beat = @story.beats.create(beat_params)
		@beat = @story.beats.build
	end

	def edit
		@beat = Beat.find(params[:id])
	end

	def create
		@story = Story.find(params[:story_id])
		@beat = @story.beats.create(beat_params)

		redirect_to story_path(@story)
	end

	def update
		@story = Story.find(params[:story_id])
		@beat = @story.beats.find(params[:id])
	end

	private
		def beat_params
			params.require(:beat).permit(:picture, :story_id)
		end


end
