class PinsController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show]
  before_action :set_pin, only: [:show, :edit, :update, :destroy]
  before_action :correct_user, only: [:edit, :update, :destroy]
  


  def index
    @pins = Pin.all.order("created_at DESC")
  end

  def show
  end

  def new
    @pin = current_user.pins.build
  end

  def edit
  end

  def create
    @pin = current_user.pins.build(pin_params)
   if @pin.save
    redirect_to @pin, notice: 'You Successfully made a Pin! Congrats!'
  else
    render action: 'edit'
    end

  end

  def update
    if @pin.update(pin_params)
      redirect_to @pin, notice: 'Pin was Updated, Good Job!'
    else
      render action: 'edit'
  end
end

  def destroy
    @pin.destroy
    redirect_to pins_url
  end

  private
    def set_pin
      @pin = Pin.find(params[:id])
    end

    def correct_user
      @pin = current_user.pins.find_by(id: params[:id])
      redirect_to pins_path, notice: "wait you can't do that!?" if @pin.nil?
    end

    def pin_params
      params.require(:pin).permit(:description, :image)
    end
end

