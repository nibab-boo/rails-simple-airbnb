class FlatsController < ApplicationController
  before_action :find_flat

  def index
    @flats = Flat.all
  end

  def show; end

  def new
    @flat = Flat.new
  end

  def create
    flat = Flat.new(build_flat)
    if flat.save
      flat_path(flat)
    else
      render :new
    end
  end

  def edit; end

  def update
    if @flat.update(build_flat)
      flat_path(flat)
    else
      render :edit
    end
  end

  def delete
    @flat.destroy
  end

  private

  def build_flat
    params.require(:flat).permit(:name, :address, :description, :number_of_guests, :price_per_night)
  end

  def find_flat
    @flat = Flat.find(params[:id])
  end
end
