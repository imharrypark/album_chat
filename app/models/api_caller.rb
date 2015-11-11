class ApiCaller
  def get_artist(name)
    apikey = ENV["apikey"]
    result = HTTParty.get("http://api.musixmatch.com/ws/1.1/artist.search?apikey=#{apikey}&q_artist=#{name.parameterize}")
    first_result = JSON.parse(result)["message"]["body"]["artist_list"][0]["artist"]

    first_result
  end

  def get_albums_by_artist_id(id)
    apikey = ENV["apikey"]
    result = HTTParty.get("http://api.musixmatch.com/ws/1.1/artist.albums.get?artist_id=#{id}&s_release_date=desc")
  end

  private

  def parameterize(str)
    str.downcase.gsub!(" ", "%20")
  end
end