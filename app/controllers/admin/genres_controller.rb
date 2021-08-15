class Admin::GenresController < ApplicationController
    def index 
        @newgenre = Genre.new
        @genres = Genre.all
    end
    def edit
        @genre = Genre.find(params[:id])
        render :edit
    end
    def update
        @genre = Genre.find(params[:id])
        @genre.update(genre_params)
        redirect_to :admin_genres_path, notice: "更新しました."
    end
    def create
        @newgenre = Genre.new(genre_params)
        @newgenre = Genre.save
        redirect_to :admin_genres_path, notice: "追加しました."   
    end
  private
    def genre_params
      params.require(:genre).permit(:name)
    end
end
