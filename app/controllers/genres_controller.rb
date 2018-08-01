class GenresController < ApplicationController
before_action :current_user

  def index
    @genres = Genre.all
    @genre = Genre.new
  end

  def show
    @genre = Genre.find(params[:id])
  end

 end
