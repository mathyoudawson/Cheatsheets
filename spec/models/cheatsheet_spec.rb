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
   cheatsheet = create(:cheatsheet_with_cheats) 
   sorted_cheats = Cheatsheet.sort_cheats_by_category(cheatsheet.cheats)

   expect(sorted_cheats).to be_instance_of(Hash)
   expect(sorted_cheats.size).to eq(5)
  end

  it 'can sort cheats into a hash of categories and cheats' do
    cheatsheet = create(:cheatsheet_with_cheats) 
    sorted_cheats = Cheatsheet.sort_cheats_by_category(cheatsheet.cheats)


    expect(sorted_cheats.first[0]).to be_instance_of(String)
    expect(sorted_cheats.first[1]).to be_instance_of(Array)
    expect(sorted_cheats.first[1][0]).to be_instance_of(Cheat)
  end

  it 'can access sorted cheats' do
    cheatsheet = create(:cheatsheet_with_cheats) 
    sorted_cheats = Cheatsheet.sort_cheats_by_category(cheatsheet.cheats)

    expect(sorted_cheats.first[0]).to eq(sorted_cheats.first[1][0].category)
  end

  it 'can clone a cheatsheet' do
    parent_cheatsheet = create(:cheatsheet)
    cloned_cheatsheet = Cheatsheet.clone_from(parent_cheatsheet)

    expect(cloned_cheatsheet.title).to eq(parent_cheatsheet.title)
    expect(cloned_cheatsheet.description).to eq(parent_cheatsheet.description)
  end

  it 'can clone a cheatsheet with many cheats' do
    parent_cheatsheet = create(:cheatsheet_with_cheats)
    cloned_cheatsheet = Cheatsheet.clone_from(parent_cheatsheet)
    cloned_cheatsheet.save

    expect(cloned_cheatsheet.cheats.count).to eq(parent_cheatsheet.cheats.count)
  end

  it 'clones the parent cheats safely' do
    parent_cheatsheet = create(:cheatsheet_with_cheats)

    expect { Cheatsheet.clone_from(parent_cheatsheet).save }.to change { Cheat.count }.by(parent_cheatsheet.cheats.count)
  end
end
