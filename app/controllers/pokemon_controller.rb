class PokemonController < ApplicationController
  def index
  end

  def show
    response = HTTParty.get("http://pokeapi.co/api/v2/pokemon/#{params[:id]}/")
    body = JSON.parse(response.body)
    name = body["name"]
    id = body["id"]
    types = body["types"].map {|type| type["type"]["name"]}

    render json: {
      id: id,
      name: name,
      types: types,
    }
  end
end
