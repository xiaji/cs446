# This controller controls an instance of a foster parent as is defined in the model
# This controller should not usually be able to be viewed from the app

class FosterParentsController < ApplicationController
  before_action :set_foster_parent, only: [:show, :edit, :update, :destroy]

  # GET /foster_parents
  # GET /foster_parents.json
  def index
    @foster_parents = FosterParent.all
  end

  # GET /foster_parents/1
  # GET /foster_parents/1.json
  def show
  end

  # GET /foster_parents/new
  def new
    @foster_parent = FosterParent.new
  end

  # GET /foster_parents/1/edit
  def edit
  end

  # POST /foster_parents
  # POST /foster_parents.json
  def create
    @foster_parent = FosterParent.new(foster_parent_params)
    if session[:selected_pet_id]
      @foster_parent.update(pet_id: session[:selected_pet_id])
      Pet.find(@foster_parent.pet_id).update(status: "fostered")
      session[:selected_pet_id] = nil
    end
    respond_to do |format|
      if @foster_parent.save
        format.html { redirect_to animal_display_path, notice: 'Congratulations on your new adoption!' }
        format.json { render action: 'show', status: :created, location: @foster_parent }
      else
        format.html { render action: 'new' }
        format.json { render json: @foster_parent.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /foster_parents/1
  # PATCH/PUT /foster_parents/1.json
  def update
    respond_to do |format|
      if @foster_parent.update(foster_parent_params)
        format.html { redirect_to @foster_parent, notice: 'Foster parent was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @foster_parent.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /foster_parents/1
  # DELETE /foster_parents/1.json
  def destroy
    @ref_pet = Pet.find_by_id(@foster_parent.pet_id)
    if @ref_pet
      @ref_pet.update(status: "available")
    end
    @foster_parent.destroy
    respond_to do |format|
      format.html { redirect_to foster_parents_url }
      format.json { head :no_content }
    end
  end

  def view_all
    @foster_parents = FosterParent.all
    @latest = FosterParent.order(:updated_at).last
    if stale?(@latest)
      respond_to do |format|
        format.atom
      end
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_foster_parent
      @foster_parent = FosterParent.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def foster_parent_params
      params.require(:foster_parent).permit(:name, :address, :email, :pet_id)
    end
end
