class CheatsController < ApplicationController
  def create
    @cheatsheet = Cheatsheet.find(params[:cheatsheet_id])
    @cheat = @cheatsheet.cheats.create(cheat_params)
    redirect_to cheatsheet_path(@cheatsheet)
  end

  private
  def cheat_params
    params.require(:cheat).permit(:term, :description)
  end
end
