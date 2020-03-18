class Admins::GenresController < ApplicationController
	def index
		@genre = Genre.new
		@genres = Genre.all
	end

	def create
	@genre = Genre.new(genre_params)
		if @genre.save
			redirect_to admins_root_path
			flash[:notice] = "Genre was successfully created."
		else
			redirect_to admins_root_path
			flash[:notice] = "Genre was not successfully created."
		end
	end

	def edit
		
	end

	def update
		
	end

	private

	def genre_params
  		params.require(:genre).permit(:genre_name, :flag_active)
  	end
end