class FlatsController < ApplicationController
  before_action :set_flat, only: [:show, :edit, :update, :destroy]
  skip_before_action :authenticate_user!, only: [:index, :show]

  def index
    @flats = Flat.where(address: params["address"], price: (params["price"].to_i*8/10)..(params["price"].to_i*10/8))
  end

  def show
    @appointments = @flat.appointments
  end

  def new
    @flat = Flat.new
  end

  def create
    @flat = Flat.new(flat_params)
    @flat.user = current_user
    if @flat.save
      redirect_to flat_path(@flat)
    else
      render :new
    end
  end

  def edit
  end

  def update
    if @flat.update(flat_params)
      redirect_to flats_path
    else
      render :edit
    end
  end

  def destroy
    @flat.destroy
    redirect_to flats_path
  end

  private

  def flat_params
    params.require(:flat).permit(:title, :price, :address, :description, :number_of_rooms, :user_id)
  end

  def set_flat
    @flat = Flat.find(params[:id])
  end
end
