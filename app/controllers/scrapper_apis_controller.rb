class ScrapperApisController < ActionController::Base
  skip_before_action :verify_authenticity_token

  def show
  respond_to do |format|
          format.json { render json: { "message": "Successful GET request " } }
    end

  end

  def create
    respond_to do |format|
      process_post(request.raw_post)
      format.json { render json: { "message": "Successful POST payload: #{request.raw_post}" } }
    end
  end

  def process_post(data)
    cs = Cheatsheet.new(:title => "Vim", :description => "Imported cheatsheet")
    json_data = JSON.parse(data) 
    json_data.each do |category_hash|
      category = category_hash["category"]
      commands_array = category_hash["commands"]
      commands_array.each do |command_hash|
        term = command_hash["cmd"]
        description = command_hash["description"]
        cs_cheats = cs.cheats.new(:term => term, :description => description, :category => category)
      end
    end
    create_cheatsheet(cs)
  end

  def create_cheatsheet(object)
    if object.save
      render json: { "message": "Cheatsheet sucessfully created" }
    else
      render json: { "message": "Cheatsheets failed to save! #{object.errors.full_messages}"}
    end
  end
end
