require 'rails_helper'

RSpec.describe Cheatsheet, type: :model do
  it 'can create a valid cheatsheet' do
    @cheatsheet = Cheatsheet.new(:title => 'Example', :description => 'An example cheatsheet')
    expect(@cheatsheet).to be_valid
  end

  it 'cheatsheet not to be valid' do
    @cheatsheet = Cheatsheet.new(:title => '', :description => '')

    expect(@cheatsheet).to_not be_valid
  end
end
