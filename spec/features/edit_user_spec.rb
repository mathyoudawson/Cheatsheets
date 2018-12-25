require 'rails_helper'

describe "editing a user", type: :feature do
  let!(:user) { create(:user) } 

  it 'edits my details' do
    page.set_rack_session(user_id: user.id)
    visit "/users/#{user.id}/edit"
    fill_in 'user_password', with: 'foobarbaz'
    fill_in 'user_password_confirmation', with: 'foobarbaz'
    click_button 'Save changes'
    expect(page).to have_content 'Profile updated'
  end

  it 'does not edit my profile with invalid credentials' do
page.set_rack_session(user_id: user.id)
    visit "/users/#{user.id}/edit"
    fill_in 'user_password', with: 'foo'
    fill_in 'user_password_confirmation', with: 'fo'
    click_button 'Save changes'
    expect(page).to have_content 'Could not update profile'
  end
end
