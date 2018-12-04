class PagesController < ApplicationController
  def home
    @vehicles = Vehicle.all
  end
end
