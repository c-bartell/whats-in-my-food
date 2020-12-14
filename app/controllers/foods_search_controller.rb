class FoodsSearchController < ApplicationController
  def index
    # response = FoodsSearchService.conn.get('/fdc/v1/foods/search') do |req|
    #   req.params[:query] = query
    #   req.params[:pageSize] = 10
    # end
    #
    # @results = JSON.parse(response.body, symbolize_names: true)
    @results = FoodsSearchService.foods_search(query)
  end

  private

  def query
    params[:q]
  end
end
