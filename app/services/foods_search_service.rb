class FoodsSearchService
  def self.conn
    Faraday.new(url: 'https://api.nal.usda.gov') do |req|
      req.params[:api_key] = ENV['FDC_API_KEY']
    end
  end

  def self.foods_search(query)
    JSON.parse(self.search_request(query).body, symbolize_names: true)
  end

  def self.search_request(query)
    self.conn.get('/fdc/v1/foods/search') do |req|
      req.params[:query] = query
      req.params[:pageSize] = 10
    end
  end
end
