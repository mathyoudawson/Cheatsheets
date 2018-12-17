require 'rails_helper'

RSpec.describe 'deserializer_service' do

  let(:request){{
    "metadata": {
      "title": "Vim",
      "description": "Imported cheatsheet"
    },
    "payload": [{
      "category": "Global",
      "commands": [{
        "term": ":help keyword",
        "description": ":help keyword - open help for keyword"
      }, {
        "term": ":saveas file", "description": ":saveas file - save file as"}]}]
  }.to_json
  }

  let(:invalid_request){{
    "payload": [{
      "category": "Global",
      "commands": [{
        "term": ":help keyword",
        "description": ":help keyword - open help for keyword"
      }, {
        "term": ":saveas file", "description": ":saveas file - save file as"}]}]
  }.to_json
  }

  let(:deserialized_json){
    Api::V2::DeserializerService.new(request).process_json
  }

  it 'has valid data' do
    true
  end

  it 'processes the title metadata' do
    deserialized_json = Api::V2::DeserializerService.new(request).process_json
    expect(deserialized_json.title).to eq('Vim')
  end

  it 'processes the description metadata' do
    deserialized_json = Api::V2::DeserializerService.new(request).process_json
    expect(deserialized_json.description).to eq('Imported cheatsheet')
  end

  it 'validates the json' do
    valid_json = Api::V2::DeserializerService.new(request).validate_json!(request)
    expect(valid_json).to be true
  end

  it 'does not validate invalid json' do
    invalid_json = Api::V2::DeserializerService.new(invalid_request)
    expect(invalid_json.validate_json!(invalid_request)).to eq("The property '#/' did not contain a required property of 'metadata'")
  end

  it 'returns a cheatsheet' do
    deserialized_json = Api::V2::DeserializerService.new(request).process_json
    expect(deserialized_json.class).to eq(Cheatsheet)
  end
end
