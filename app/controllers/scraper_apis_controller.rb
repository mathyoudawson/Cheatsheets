class ScraperApisController < ActionController::Base
  skip_before_action :verify_authenticity_token

  def show
    respond_to do |format|
      format.json { render json: { "message": "Successful GET request " } }
    end
  end

  def create
    @cheatsheet = ScraperService.new(request.raw_post).process_json
    respond_to do |format|
      # format.json { render json: { "message": "Successful POST payload: #{request.raw_post}" } }
      if @cheatsheet.save
        format.json { render json: { "message": "Cheatsheet sucessfully created" } }
      else
        format.json { render json: { "message": "Cheatsheets failed to save! #{@cheatsheet.errors.full_messages}"} }
      end
    end
  end
end

