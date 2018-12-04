class VehiclesController < ApplicationController
  def index
    @vehicles = Vehicle.all
  end

  def show
    @vehicle = Vehicle.find(params[:id])
  end

  def new
  end

  def create
  end

  def edit
  end

  def update
  end

  def delete
  end
end
