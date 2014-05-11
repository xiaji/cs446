# This controller controls the foster agreement page, and delegates the
# confirmation action, as well as passes through the pet id

class FosterController < ApplicationController
  def agreement
    @selected_pet = Pet.find(params[:id])
  end

  def confirmation
    @selected_pet = Pet.find(params[:id])
  end
end
