FactoryBot.define do

  factory :request do
    metadata {"title": "Vim","description": "Imported cheatsheet"}
    payload [{"category": "Global","commands": [{"term": ":help keyword","description": ":help keyword - open help for keyword"}, {"term": ":saveas file","description": ":saveas file - save file as"}]}]
  end
end
