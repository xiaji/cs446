# This controller controls a pet considering, which is akin to a
# line item in the depot app

class PetConsideringsController < ApplicationController
  include CurrentConsidering
  before_action :set_considering, only: [:create]
  before_action :set_pet_considering, only: [:show, :edit, :update, :destroy]

  # GET /pet_considerings
  # GET /pet_considerings.json
  def index
    @pet_considerings = PetConsidering.all
  end

  # GET /pet_considerings/1
  # GET /pet_considerings/1.json
  def show
  end

  # GET /pet_considerings/new
  def new
    @pet_considering = PetConsidering.new
  end

  # GET /pet_considerings/1/edit
  def edit
  end

  # POST /pet_considerings
  # POST /pet_considerings.json
  def create
    pet = Pet.find(params[:pet_id])
    @pet_considering = @considering.add_pet_if_not_exists(pet.id)

    respond_to do |format|
      if @pet_considering.save
        format.html { redirect_to animal_display_url }
        format.js { @current = @pet_considering }
        format.json { render action: 'show', status: :created, location: @pet_considering }
      else
        format.html { render action: 'new' }
        format.json { render json: @pet_considering.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /pet_considerings/1
  # PATCH/PUT /pet_considerings/1.json
  def update
    respond_to do |format|
      if @pet_considering.update(pet_considering_params)
        format.html { redirect_to @pet_considering, notice: 'Pet considering was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @pet_considering.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /pet_considerings/1
  # DELETE /pet_considerings/1.json
  def destroy
    @pet_considering.destroy
    respond_to do |format|
      format.html { redirect_to pet_considerings_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_pet_considering
      @pet_considering = PetConsidering.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def pet_considering_params
      params.require(:pet_considering).permit(:pet_id)
    end
end
