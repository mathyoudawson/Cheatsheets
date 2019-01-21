class CheatsheetsController < ApplicationController
  def index
    @cheatsheets = Cheatsheet.search(params[:search_term], 'title').paginate(page:params[:page])
  end

  def new
    unless logged_in?
      flash[:info] = "Please sign up to create a cheatsheet"
      redirect_to signup_path
    end
    @cheatsheet = Cheatsheet.new
  end

  def show
    @cheatsheet = Cheatsheet.find(params[:id])
    @cheats = @cheatsheet.cheats
    if params[:search_term]
      search_results = @cheats.search(params[:search_term], 'term')
      search_results += @cheats.search(params[:search_term], 'description')
      @cheats = search_results
    end

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
    @cheatsheet.user = current_user

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

  def clone
    @cheatsheet = Cheatsheet.clone_from(params[:cheatsheet_id])
    @cheatsheet.user = current_user
    if @cheatsheet.save
      redirect_to @cheatsheet
      flash[:success] = "Successfully cloned cheatsheet"
    else
      redirect_to cheatsheets_path
      flash[:danger] = "Could not clone cheatsheet"
    end
  end

  private
  def cheatsheet_params
    params.require(:cheatsheet).permit(:title, :description, :search_term)
  end
end
