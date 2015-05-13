class DirectorsController < ApplicationController
  def index
    @directors = Director.all
  end

  def show
    @director = Director.find(params[:id].to_i)
  end

  def new_form
    render('new_form.html.erb')
  end

  def create_row
    d = Director.new
    d.dob = params[:dob]
    d.name = params[:name]
    d.bio = params[:bio]
    d.image_url = params[:image_url]
    d.save

    @director = Director.last
    render("show")
  end

  def edit_form
    @director = Director.find(params[:id])
  end

  def update_row
    @director = Director.find(params[:id].to_i)

    d = Director.find(params[:id])

    d.dob = params[:dob].to_s
    d.name = params[:name].to_s
    d.bio = params[:bio].to_s
    d.image_url = params[:image_url].to_s
    d.save

    @director = Director.find(params[:id].to_i)
    render("show")
  end

  def destroy
    @director_name = Director.find(params[:id]).name

    d = Director.find(params[:id])
    d.destroy
  end
end
