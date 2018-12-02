class CheatsheetsController < ApplicationController
  def index
    @cheatsheets = Cheatsheet.all
  end

  def new
    @cheatsheet = Cheatsheet.new
  end

  def show
    @cheatsheet = Cheatsheet.find(params[:id])
  end

  def create
    @cheatsheet = Cheatsheet.new(cheatsheet_params)

    if @cheatsheet.save
      redirect_to @cheatsheet
    else
      render 'new'
    end
  end

  private
  def cheatsheet_params
    params.require(:cheatsheet).permit(:title, :description)
  end
end
