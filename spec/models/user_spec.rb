require 'rails_helper'

RSpec.describe User, type: :model do

    let(:user) {
      User.new(:name => 'Testee', :email => 'test@user.com',
              password: "foobar", password_confirmation: "foobar")
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

  it 'should have a present (nonblank) password' do
    user.password = user.password_confirmation = " " * 7
    expect(user.valid?).to be false
  end

  it 'has a minimum length for password' do
    user.password = user.password_confirmation = "a" * 5
    expect(user.valid?).to be false
  end

  it 'authentiated? reutns false for a user with nil digest' do
    expect(user.authenticated?('')).to be false
  end
end
