class PokemonController < ApplicationController
  def index
  end

  def show
    response = HTTParty.get("http://pokeapi.co/api/v2/pokemon/#{params[:id]}/")
    body = JSON.parse(response.body)

    if body["detail"] == "Not found."
      render json: { message: "Sorry, we don't have that Pokemon."}
    else
    name = body["name"]
    id = body["id"]
    types = body["types"].map {|type| type["type"]["name"]}

    res = HTTParty.get("https://api.giphy.com/v1/gifs/search?api_key=#{ENV['GIPHY_KEY']}&q=#{name}&rating=pg")
    body = JSON.parse(res.body)
    gif_url = body["data"].sample["url"]

    render json: {
      id: id,
      name: name,
      types: types,
      gif: gif_url,
    }
    end
  end
end
