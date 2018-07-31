class Admin::GenresController < Admin::BaseController
  # before_action :require_admin

 def index
   @genres = Genre.all
   @genre = Genre.new
 end

 def new
   @genre = Genre.new
 end

 def create
   @genre = Genre.create(genre_params)
   if @genre.save
     redirect_to admin_genres_path
   else
     render :index
   end
 end

 private

 def genre_params
   params.require(:genre).permit(:name)
 end
end
