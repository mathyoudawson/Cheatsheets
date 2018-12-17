require 'rails_helper'

RSpec.describe 'deserializer_service' do

  let(:request) {[{"category":"Global","commands":[{"cmd":":help keyword","description":":help keyword - open help for keyword"},{"cmd":":saveas file","description":":saveas file - save file as"}]}].to_json}

  it 'returns a cheatsheet' do
    deserialized_json = Api::V1::DeserializerService.new(request).process_json
    expect(deserialized_json.class).to eq(Cheatsheet)
  end
end
