class MoviesController < ApplicationController

	def index
		@movies = Movie.released
	end

	def show
		@movie = Movie.find(params[:id])
	end

	def edit
		@movie = Movie.find(params[:id])
	end

	def update
		@movie = Movie.find(params[:id])
		movie_params = params.require(:movie).permit(:title, :description, :rating, :released_on, :total_gross, :cast, :director, :duration, :image_file_name)
		if @movie.update(movie_params)
			flash[:notice] = "Movie successfully updated"
			redirect_to @movie
		else 
			render :edit
		end

	end

	def new
		@movie = Movie.new
	end

	def create
		movie_params = params.require(:movie).permit(:title, :description, :rating, :released_on, :total_gross, :cast, :director, :duration, :image_file_name)
		@movie = Movie.new(movie_params)
		if @movie.save
			flash[:notice] = "Movie successfully created"
			redirect_to @movie
		else 
			render :new
		end
		# redirect_to @movie
	end

	def destroy
		@movie = Movie.find(params[:id])
  	if @movie.destroy
  		flash[:notice] = "Movie successfully deleted"
  		redirect_to movies_url
  	else
  		redirect_to @movie
  	end
	end

end

