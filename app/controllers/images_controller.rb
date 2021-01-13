class ImagesController < ActionController::Base
  def new
    @image = Image.new
  end

  def create
    @image = Image.create(params[:image].permit(:link))
  end
end
