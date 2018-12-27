require 'rails_helper'

describe 'the password reset process', tupe: :feature do
  it 'navigates to password reset page' do
    visit '/' #root
    click_link 'Log In'
    click_link 'forgot password'

    expect(page).to have_content 'Forgot password'
  end

  it 'submits password reset request' do
    user = create(:user)
    visit '/password_resets/new'
    fill_in 'password_reset_email', with: user.email
    click_button 'Submit'
    expect(page).to have_content 'Email sent with password reset instructions'
  end
  
  it 'completes reset' do
    user = create(:user)
    visit '/password_resets/new'
    fill_in 'password_reset_email', with: user.email
    click_button 'Submit'

    # Tokens are all nil even after reloading user. Therefor I cann't visit the reset path
  end
end
