require 'rails_helper'

RSpec.describe 'Foods Search Service' do
  describe 'Class Methods' do
    it '::conn' do
      conn = FoodsSearchService.conn
      expect(conn.class).to eq(Faraday::Connection)
      expect(conn.url_prefix.to_s).to eq("https://api.nal.usda.gov/")
      expect(conn.params[:api_key]).to_not be_nil
    end
  end
end
