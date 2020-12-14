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

        it 'Then I should see a list of ten foods that contain the ingredient "sweet potatoes"' do
          within '.foods' do
            expect(page).to have_css('.food', count: 10)
            within first '.food' do
              expect(page).to have_content('Description: SWEET POTATOES')
            end
          end
        end
      end
    end
  end
end

# And for each of the foods I should see:
# - The food's GTIN/UPC code
# - The food's description
# - The food's Brand Owner
# - The food's ingredients
