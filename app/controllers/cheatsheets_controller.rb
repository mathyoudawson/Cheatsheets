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

  def edit
    @cheatsheet = Cheatsheet.find(params[:id])
  end

  def update
    @cheatsheet = Cheatsheet.find(params[:id])

    if @cheatsheet.update(cheatsheet_params)
      redirect_to @cheatsheet
    else
      render 'edit'
    end
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
