class ApiCaller
  def get_artist(name)
    apikey = ENV["apikey"]
    result = HTTParty.get("http://api.musixmatch.com/ws/1.1/artist.search?apikey=#{apikey}&q_artist=#{name.parameterize}")
    result = JSON.parse(result)["message"]["body"]["artist_list"][0]["artist"]

    result
  end

  def get_albums_by_artist_id(id)
    apikey = ENV["apikey"]
    result = HTTParty.get("http://api.musixmatch.com/ws/1.1/artist.albums.get?apikey=#{apikey}&artist_id=#{id}&s_release_date=desc")
    result = JSON.parse(result)["message"]["body"]["album_list"]

    result
  end

  private

  def parameterize(str)
    str.downcase.gsub!(" ", "%20")
  end
end