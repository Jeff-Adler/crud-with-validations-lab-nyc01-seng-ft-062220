require 'pry'

class SongsController < ApplicationController
    before_action :find_song, only: [:edit, :update, :destroy, :show]

    def index 
        @songs = Song.all
    end

    def new 
        @song = Song.new
    end

    def create 

        @song = Song.create(song_params)

        if @song.valid?
            redirect_to song_path(@song)
        else
            render :new
        end

    end

    def show 
    end

    def edit 
    end

    def update 

        if @song.update(song_params)
            @song.update(song_params)
            redirect_to song_path(@song)
        else
            render :edit
        end

    end

    def destroy 
        @song.destroy

        redirect_to songs_path
    end

    private

    def song_params
        params.require(:song).permit(:title,:released,:release_year,:artist_name,:genre)
    end

    def find_song
        @song = Song.find(params[:id])
    end
end
