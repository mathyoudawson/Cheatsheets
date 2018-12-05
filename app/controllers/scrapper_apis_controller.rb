class ScrapperApisController < ActionController::Base
  def show
  respond_to do |format|
          format.json { render json: { "message": "Successful GET request " } }
    end

  end

  def create
    respond_to do |format|
          format.json { render json: { "message": "Successful POST payload: #{request.payload.read}" } }
    end
  end
end
