require 'rails_helper'

RSpec.describe 'deserializer_service' do

  let(:request) {[{"category":"Global","commands":[{"cmd":":help keyword","description":":help keyword - open help for keyword"},{"cmd":":saveas file","description":":saveas file - save file as"}]}].to_json}

  it 'returns a cheatsheet' do
    deserializer = DeserializerService.new(request)
    processed_cheatsheet = deserializer.process_json
    expect(processed_cheatsheet.class).to eq(Cheatsheet)
  end
end
