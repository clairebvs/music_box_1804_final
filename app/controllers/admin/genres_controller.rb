class Admin::GenresController < Admin::BaseController

 def index
   @genres = Genre.all
   @genre = Genre.new
 end

 def new
   @genre = Genre.new
 end

 def create
   @genre = Genre.create(genre_params)
   if current_admin? && @genre.save
     redirect_to genres_path
   else
     render :index
   end
 end

 private

 def genre_params
   params.require(:genre).permit(:name)
 end
end
