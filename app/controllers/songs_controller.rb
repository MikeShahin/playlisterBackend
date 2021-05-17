require 'pry'
class SongsController < ApplicationController

    def index
        @songs = Song.all
        render json: @songs
    end

    def show
        @song = Song.find_by(id: params[:id])
        if @song
            render json: @song
        else
            render json: {error: "nothing found"}
        end
    end

    def create
        @song = Song.create(song_params)
        if @song
            render json: {song: @song, message: "created!"}
        else
            render json: {error: "something went wrong, song not saved!"}
        end
    end

    private

    def song_params
        params.require(:song).permit(:artist, :songName, :preview, :playlist_id)
    end
end
