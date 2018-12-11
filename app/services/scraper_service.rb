class ScraperService
  def initialize(request)
    @json_data = JSON.parse(request)
    @cheatsheet = Cheatsheet.new(:title => "Vim", :description => "Imported cheatsheet")
  end

  def process_json
    @json_data.each do |category_hash|
      process_category_hash(category_hash)
    end
    @cheatsheet
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
