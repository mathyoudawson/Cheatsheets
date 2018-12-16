module Api
  module V2
    class DeserializerService
      CHEATSHEET_SCHEMA = "#{Rails.root}/app/services/api/v2/cheatsheet_schema.json"

      def initialize(request)
        @json_data = JSON.parse(request)
        @cheatsheet = Cheatsheet.new
      end

      def process_json
        validate_json!(@json_data)
        process_metadata(@json_data["metadata"])
        process_payload(@json_data["payload"])
        @cheatsheet
      end

      def validate_json!(json)
        JSON::Validator.validate!(CHEATSHEET_SCHEMA, json)
      end

      def process_metadata(metadata)
        @cheatsheet.title = metadata['title']
        @cheatsheet.description = metadata['description']
      end

      def process_payload(payload)
        payload.each do |category_hash|
          process_category_hash(category_hash)
        end
      end

      def process_category_hash(category_hash)
        category = category_hash["category"]
        commands_array = category_hash["commands"]
        commands_array.each do |command_hash|
          process_command_hash(command_hash, category)
        end
      end

      def process_command_hash(command_hash, category)
        term = command_hash["cmd"]
        description = command_hash["description"]
        @cheatsheet.cheats.new(:term => term, :description => description, :category => category)
      end
    end
  end
end
