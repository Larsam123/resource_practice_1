class MoviesController < ApplicationController
  def index
    @movies = Movie.all
  end

  def show
    @movie = Movie.find(params[:id])
  end

  def new_form
  end

  def create_row
    m = Movie.new

    m.title = params[:title]
    m.year = params[:year]
    m.duration = params[:duration]
    m.description = params[:description]
    m.image_url = params[:image_url]
    m.director_id = params[:director_id]

    m.save

    redirect_to("http://localhost:3000/")
  end

  def edit_form
    @movie = Movie.find(params[:id])
  end

  def update_row
    m = Movie.find(params[:id])

    m.title = params[:title].to_s
    m.year = params[:year].to_i
    m.duration = params[:duration].to_i
    m.description = params[:description].to_s
    m.image_url = params[:image_url].to_s
    m.director_id = params[:director_id].to_i

    m.save

    redirect_to("http://localhost:3000/")
  end

  def destroy
    @movie_title = Movie.find(params[:id].to_i).title

    m = Movie.find(params[:id].to_i)
    m.destroy
  end
end
