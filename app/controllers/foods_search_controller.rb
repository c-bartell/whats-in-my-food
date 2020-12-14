class FoodsSearchController < ApplicationController
  def index
    conn = Faraday.new(url: 'https://api.nal.usda.gov') do |req|
      req.params[:api_key] = ENV['FDC_API_KEY']
    end
    response = conn.get('/fdc/v1/foods/search') do |req|
      req.params[:query] = query
    end

    @results = JSON.parse(response.body, symbolize_names: true)
  end

  private

  def query
    params[:q]
  end
end
