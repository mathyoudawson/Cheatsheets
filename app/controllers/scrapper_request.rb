class ScrapperApisController < ActionController::Base
  def show
    render text: 'Successful GET request'
  end

  def create
    render text: "Sucessful POST Payload: #{request.body.read}"
  end
end
