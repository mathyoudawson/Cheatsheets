require 'rails_helper'

RSpec.describe 'cheatsheet_api_controller' do
  it 'exisits' do
    expect(Api::V1::CheatsheetApiController.new).to be_truthy
  end
end
