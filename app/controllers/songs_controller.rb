class SongsController < ApplicationController   
    def index
        @songs = Song.all
    end

    def show
        find_song
     end
 
     def new
         @song = Song.new
     end
 
     def create
         @song = Song.create(song_params)
         if @song.valid?
             @song.save
             redirect_to song_path(@song)
         else
             render :new
         end
     end
 
     def edit
        find_song
     end
 
     def update
         @song = Song.find_by(id: params[:id])
         if @song.update(song_params)
             redirect_to song_path(@song)
           else
             render :edit
           end
     end
 
     def destroy
         find_song
         @song.destroy
         redirect_to songs_url
     end
 
     private
 
     def song_params
         params.require(:song).permit(:title, :artist_name, :release_year, :released, :genre)
     end
 
     def find_song
         @song = Song.find_by(id: params[:id])
     end
end 