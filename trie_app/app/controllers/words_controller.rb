class WordsController < ApplicationController

	before_action :render_layout_if_html
	
	def index
		@words = Word.all
		render json: @words

	end

	def create
		render json: Word.create(params.require(:word).permit(:name))
	end

	def show
	end

	def update
	end

	def destroy
	end

	private
		def render_layout_if_html
			if request.format.symbol == :html
				render "layouts/application"
			end
		end
	end


