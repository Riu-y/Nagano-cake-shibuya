class Admins::GenresController < ApplicationController
	def index
		@genre = Genre.new
		@genres = Genre.all
	end

	def create
	@genre = Genre.new(genre_params)
		if @genre.save
			redirect_to admins_genres_path
			flash[:notice] = "Genre was successfully created."
		else
			redirect_to admins_genres_path
			flash[:notice] = "Genre was not successfully created."
		end
	end

	def edit
		@genre = Genre.find(params[:id])
	end

	def update
		@genre = Genre.find(params[:id])
  		if @genre.update(genre_params)
  			redirect_to admins_genres_path
  			flash[:notice] = "Genre was successfully update."
  		else
  			render "edit"
  			flash[:notice] = "Genre was not successfully apdate."
  		end
	end

	private

	def genre_params
  		params.require(:genre).permit(:genre_name, :flag_active)
  	end
end