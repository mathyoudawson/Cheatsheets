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
    Api::V2::DeserializerService.new(request)
  }

  it 'has valid data' do
    true
  end

  it 'processes the title metadata' do
    processed_json = deserialized_json.process_json
    expect(processed_json.title).to eq('Vim')
  end

  it 'processes the description metadata' do
    processed_json = deserialized_json.process_json
    expect(processed_json.description).to eq('Imported cheatsheet')
  end

  it 'validates the json' do
    validated_json = deserialized_json.validate_json!(request)
    expect(validated_json).to be true
  end

  it 'does not validate invalid json' do
    invalidated_json = Api::V2::DeserializerService.new(invalid_request)
    expect(invalidated_json.validate_json!(invalid_request)).to eq("The property '#/' did not contain a required property of 'metadata'")
  end

  it 'returns a cheatsheet' do
    processed_json = deserialized_json.process_json 
    expect(processed_json.class).to eq(Cheatsheet)
  end
end
