class CheatsheetsController < ApplicationController
  http_basic_authenticate_with name: "mattd", password: "temp", except: [:index, :show]

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


  def destroy
    @cheatsheet = Cheatsheet.find(params[:id])
    @cheatsheet.destroy

    redirect_to cheatsheets_path
  end

private
def cheatsheet_params
    params.require(:cheatsheet).permit(:title, :description)
  end
end
