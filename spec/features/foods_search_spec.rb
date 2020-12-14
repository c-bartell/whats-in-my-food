require 'rails_helper'

RSpec.describe 'Search for food by ingredient:' do
  describe 'As a user' do
    describe 'When I visit "/"' do
      before :each do
        visit root_path
      end
      describe 'And I fill in the search form with "sweet potatoes" and click search' do
        before :each do
          fill_in :q, with: "sweet potatoes"
          click_button 'Search'
        end

        it 'Then I should be on page "/foods"' do
          expect(current_path).to eq(foods_path)
        end

        it 'Then I should see a total number of items returned by the search.' do
          expect(page).to have_content("39244 total results")
        end
      end
    end
  end
end

# Then I should see a total of the number of items returned by the search.
# Then I should see a list of ten foods that contain the ingredient "sweet potatoes"
# And for each of the foods I should see:
# - The food's GTIN/UPC code
# - The food's description
# - The food's Brand Owner
# - The food's ingredients
