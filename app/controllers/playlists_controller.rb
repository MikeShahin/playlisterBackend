class PlaylistsController < ApplicationController
    def index
        playlists = Playlist.all
        render json: playlists
    end

    def show
        @playlist = Playlist.find_by(id: params[:id])
        if @playlist
            # render json: @playlist
            render json: @playlist.songs
        else 
            render json: {error: "playlist doesn't exist"}
        end
    end

    def create
        @playlist = Playlist.create(playlist_params)
        if @playlist
            render json: {playlist: @playlist, message: "created!"}
        else
            render json: {error: "something went wrong, playlist not saved!"}
        end
    end

    private

    def playlist_params
        params.require(:playlist).permit(:name)
    end
end
