require 'rails_helper'

RSpec.describe Cheatsheet, type: :model do
  it 'can create a valid cheatsheet' do
    @cheatsheet = build(:cheatsheet)
    expect(@cheatsheet).to be_valid
  end

  it 'cheatsheet not to be valid' do
    @cheatsheet = build(:cheatsheet, :title => '', :description => '')

    expect(@cheatsheet).to_not be_valid
  end

  it 'can sort child cheats into categories' do
    
  end

  it 'can clone a cheatsheet' do
    parent_cheatsheet = create(:cheatsheet)
    cloned_cheatsheet = Cheatsheet.clone_from(parent_cheatsheet.id)

    expect(cloned_cheatsheet.title).to eq(parent_cheatsheet.title)
    expect(cloned_cheatsheet.description).to eq(parent_cheatsheet.description)
  end

  it 'can clone a cheatsheet with many cheats' do
    parent_cheatsheet = create(:cheatsheet_with_cheats)
    cloned_cheatsheet = Cheatsheet.clone_from(parent_cheatsheet.id)
    cloned_cheatsheet.save

    expect(cloned_cheatsheet.cheats.count).to eq(parent_cheatsheet.cheats.count)
  end

  it 'clones the parent cheats safely' do
    parent_cheatsheet = create(:cheatsheet_with_cheats)

    expect { Cheatsheet.clone_from(parent_cheatsheet.id).save }.to change { Cheat.count }.by(parent_cheatsheet.cheats.count)
  end
end
