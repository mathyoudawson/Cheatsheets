class ScrapperApisController < ActionController::Base
  skip_before_action :verify_authenticity_token

  def show
  respond_to do |format|
          format.json { render json: { "message": "Successful GET request " } }
    end

  end

  def create
    respond_to do |format|
      format.json { render json: { "message": "Successful POST payload: #{request.raw_post}" } }
    end
  end
end
