class QueriesController < ApplicationController
  def search_artist
  end

  def search_album
    apicaller = ApiCaller.new
    artist = apicaller.get_artist(params[:artist_name])
    albums = apicaller.get_albums_by_artist_id(artist["artist_id"])
    albums_arr = []
    albums.each do |a|
      hash = {}
      hash["name"] = a["album"]["album_name"]
      hash["artist"] = a["album"]["artist_name"]
      hash["release_date"] = a["album"]["album_release_date"]
      albums_arr << hash
    end
    session[:albums_arr] = albums_arr

    @albums_arr = albums_arr
  end
end
