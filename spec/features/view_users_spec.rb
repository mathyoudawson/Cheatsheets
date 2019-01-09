require 'rails_helper'

describe 'users', type: :feature do
    let(:user) { create(:user) }
    let(:admin_user) { create(:user, admin: true) }
  describe "viewing users", type: :feature do

    it 'views all users' do
      page.set_rack_session(user_id: user.id)

      visit '/users'

      expect(page).to have_content 'Explore Users'
    end
    
    it 'views all users' do
      page.set_rack_session(user_id: user.id)
      inactive_user = create(:user, activated: false, activated_at: nil)

      visit "/users/#{inactive_user.id}"

      # Testing that you are redirected to url
      expect(page).to have_content 'Explore'
    end

    it 'as an admin' do
      create(:user)
      page.set_rack_session(user_id: admin_user.id)

      visit '/users'

      expect(page).to have_content 'Explore User'
      expect(page).to have_content 'delete'
    end
  end

  describe "deleting users", type: :feature do
    it 'as an admin' do
      create(:user)
      page.set_rack_session(user_id: admin_user.id)

      visit '/users'
      click_link 'delete'

      expect(page).to have_content 'User deleted'
    end
    it 'admin can not delete themselves' do
page.set_rack_session(user_id: admin_user.id)

      visit '/users'

      expect(page).to_not have_content 'delete'
    end
  end
end
