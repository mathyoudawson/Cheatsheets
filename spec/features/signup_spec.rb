require 'rails_helper'

describe "the signin process", type: :feature do
  it "signs me in" do
    visit '/users/new'
    fill_in 'user_name', with: 'Nigel'
    fill_in 'user_email', with: 'user@example.com'
    fill_in 'user_password', with: 'password'
    fill_in 'user_password_confirmation', with: 'password'
    click_button 'Create my account'
    expect(page).to have_content 'Please check your email to activate your account'
  end

  it 'completes a valid signup with activation' do
    ActionMailer::Base.deliveries.clear
    visit signup_path
    fill_in 'user_name', with: 'Nigel'
    fill_in 'user_email', with: 'user@example.com'
    fill_in 'user_password', with: 'password'
    fill_in 'user_password_confirmation', with: 'password'
    click_button 'Create my account'
    user = User.find_by(email: 'user@example.com')

    expect(ActionMailer::Base.deliveries.size).to be 1
    expect(user.activated).to be false
  end

  it 'activates account by following activation link' do
    user = create(:user, activated: false, activated_at: nil)

    visit edit_account_activation_path(user.activation_token, email: user.email)

    expect(page).to have_content 'Account activated!'
    # I need to requery my user as otherwise it does not return the updated attributes
    expect(User.find_by(email: user.email).activated).to be true
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
