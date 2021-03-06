require 'rails_helper'

describe "cheatsheets", type: :feature do
  let(:user) { create(:user) }
  describe "interacting with", type: :feature do
    it 'shows a cheatsheet' do
      create(:cheatsheet)
      page.set_rack_session(user_id: user.id)

      visit '/cheatsheets'

      expect(page).to have_content 'Explore Cheatsheets'

      click_link('Show', :match => :first)

      expect(page).to have_content 'Cheats'
    end
    it 'edits a cheatsheet' do
      cheatsheet = create(:cheatsheet)
      cheatsheet.user = user
      cheatsheet.save
      page.set_rack_session(user_id: user.id)

      visit '/cheatsheets'

      click_link 'Edit'
      fill_in 'cheatsheet_title', with: 'Emacs cheatsheet'
      fill_in 'cheatsheet_description', with: 'An updated cheatsheet'
      click_button 'Update Cheatsheet'

      expect(page).to have_content 'An updated cheatsheet'
    end
    it 'detroying a cheatsheet' do
    end
  end
  describe "creating a cheatsheet" do
    it 'creates a cheatsheet' do
      page.set_rack_session(user_id: user.id)

      visit '/cheatsheets'

      click_link 'new-cheatsheet'
      fill_in 'cheatsheet_title', with: 'Capybara Cheatsheet'
      fill_in 'cheatsheet_description', with: 'A new cheatsheet'
      click_button 'Create Cheatsheet'

      expect(page).to have_content 'Capybara Cheatsheet'
    end
    it 'creates a cheatsheet with cheats' do
      cheatsheet = create(:cheatsheet)
      cheatsheet.user = user
      cheatsheet.save
      page.set_rack_session(user_id: user.id)

      visit "/users/#{user.id}"

      expect(page).to have_content "#{user.name}'s Cheatsheets"

      click_link 'Show'
      fill_in 'cheat_category', with: 'Example'
      fill_in 'cheat_term', with: 'click button'
      fill_in 'cheat_description', with: 'Does a thing'
      click_button 'Create Cheat'

      expect(page).to have_content 'click button'
    end
  end
end
