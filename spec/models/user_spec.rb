require 'rails_helper'

RSpec.describe User, type: :model do

    let(:user) {
      User.new(:name => 'Testee', :email => 'test@user.com')
    }

  it 'should be valid' do
    expect(user.valid?).to be true
  end

  it 'should have a name' do
    user.name = ''
    expect(user.valid?).to be false
  end

  it 'should have an email' do
    user.email = ''
    expect(user.valid?).to be false
  end

  it 'should be a valid email' do
    user.email = 'test_email'
    expect(user.valid?).to be false
  end

  it 'should have a unique email' do
    duplicate_user = user.dup
    user.save
    expect(duplicate_user.valid?).to be false
  end
end
