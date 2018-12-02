require 'rails_helper'

RSpec.describe Cheatsheet, type: :model do
  it 'can create a valid cheatsheet' do
    @cheatsheet = Cheatsheet.new(:title => 'Example', :description => 'An example cheatsheet')

    expect(@cheatsheet.valid?).to be true
  end

it 'cannot create an invalid cheatsheet' do
    @cheatsheet = Cheatsheet.new(:title => '', :description => '')

    expect(@cheatsheet.valid?).to be false
  end
end
