require 'rails_helper'

describe "the signin process", type: :feature do
  it "signs me in" do
    visit '/users/new'
    fill_in 'user_name', with: 'Nigel'
    fill_in 'user_email', with: 'user@example.com'
    fill_in 'user_password', with: 'password'
    fill_in 'user_password_confirmation', with: 'password'
    click_button 'Create my account'
    expect(page).to have_content 'Sucessfully created user'
  end

  it "doesn't sign me in with invalid credentials" do
    visit 'users/new'
    fill_in 'user_name', with: 'Nigel'
    fill_in 'user_email', with: 'userexamplecom'
    fill_in 'user_password', with: 'pass'
    fill_in 'user_password_confirmation', with: 'pass'
    click_button 'Create my account'
    expect(page).to have_content 'Could not create user'
  end
end
