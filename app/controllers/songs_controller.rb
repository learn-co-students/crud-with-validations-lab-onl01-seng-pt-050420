class SongsController < ApplicationController

    def index
        @songs = Song.all
        render :index
    end 

    def show
        @song = find_song_id
        render :show
    end 

    def new
        @song = Song.new   
        render :new
    end

    def create
        @song = Song.new(song_params)
        if @song.save
        redirect_to @song
        else  
            render :new
        end 
    end

    def edit
        @song = find_song_id
    end

    def update
        @song = find_song_id
        if @song.update(song_params)
            redirect_to @song
        else  
            render :edit
        end 
    end

    def destroy
        @song = find_song_id
        @song.destroy
        redirect_to @song
    end 

    private

        def song_params
            params.require(:song).permit(:title, :artist_name, :release_year, :released, :genre)
        end 

        def find_song_id
            Song.find(params[:id])
        end 
end
