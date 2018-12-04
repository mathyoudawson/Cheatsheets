class CheatsController < ApplicationController
  http_basic_authenticate_with name: "mattd", password: "temp", only: :destroy

  def create
    @cheatsheet = Cheatsheet.find(params[:cheatsheet_id])
    @cheat = @cheatsheet.cheats.create(cheat_params)
    redirect_to cheatsheet_path(@cheatsheet)
  end

  def destroy
    @cheatsheet = Cheatsheet.find(params[:cheatsheet_id])
    @cheat = @cheatsheet.cheats.find(params[:id])
    @cheat.destroy
    redirect_to cheatsheet_path(@cheatsheet)
  end

  private
  def cheat_params
    params.require(:cheat).permit(:term, :description)
  end
end
