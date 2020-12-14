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
          end
        end

        it 'And for each of the foods I should see details' do
          within first '.food' do
            expect(page).to have_content('Description: SWEET POTATOES')
            expect(page).to have_content('GTIN/UPC Code: 070560951975')
            expect(page).to have_content('Brand Owner: The Pictsweet Company')
            expect(page).to have_content('Ingredients: SWEET POTATOES')
          end
        end
      end
    end
  end
end
