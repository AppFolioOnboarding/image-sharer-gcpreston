class ImagesController < ActionController::Base
  def new
    @image = Image.new
  end

  def create
    @image = Image.create(params[:image].permit(:link, :tag_list))
    if @image.save
      redirect_to @image
    else
      render :new, status: :unprocessable_entity
    end
  end

  def show
    @image = Image.find(params[:id])
  end

  def destroy
    @image = Image.find_by(id: params[:id])
    @image&.destroy
    redirect_to root_path
  end
end
