class FiltersController < ActionController::Base
  def show
    @filter = params[:tag]
    @images = Image.tagged_with(@filter)
  end
end
