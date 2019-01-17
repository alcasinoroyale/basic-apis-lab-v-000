class RepositoriesController < ApplicationController

  def search

  end

  def github_search
    client_id = "Iv1.e370ea355a49d6f9"
    secret = "ea6588fe6d5f39f06435ceeb64a18c0ba19f07be"

    resp = Faraday.get("https://api.github.com/search/repositories") do |req|
      req.params["q"] = params[:query]
      req.params["client_id"] = client_id
      req.params["client_secret"] = secret
    end

    body = JSON.parse(resp.body)
    @results = body["items"]
    render :search
  end
end
