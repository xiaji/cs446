# Controller that controls the current considerings
# This is akin to the cart class of the depot app

class ConsideringsController < ApplicationController
  before_action :set_considering, only: [:show, :edit, :update, :destroy]
  rescue_from ActiveRecord::RecordNotFound, with: :invalid_considering

  # GET /considerings
  # GET /considerings.json
  def index
    @considerings = Considering.all
  end

  # GET /considerings/1
  # GET /considerings/1.json
  def show
  end

  # GET /considerings/new
  def new
    @considering = Considering.new
  end

  # GET /considerings/1/edit
  def edit
  end

  # POST /considerings
  # POST /considerings.json
  def create
    @considering = Considering.new(considering_params)

    respond_to do |format|
      if @considering.save
        format.html { redirect_to @considering, notice: 'Considering was successfully created.' }
        format.json { render action: 'show', status: :created, location: @considering }
      else
        format.html { render action: 'new' }
        format.json { render json: @considering.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /considerings/1
  # PATCH/PUT /considerings/1.json
  def update
    respond_to do |format|
      if @considering.update(considering_params)
        format.html { redirect_to @considering, notice: 'Considering was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @considering.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /considerings/1
  # DELETE /considerings/1.json
  def destroy
    @considering.destroy if @considering.id == session[:considering_id]
    session[:considering_id] = nil
    respond_to do |format|
      format.html { redirect_to animal_display_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_considering
      @considering = Considering.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def considering_params
      params[:considering]
    end

    def invalid_considering
      logger.error "Attempted to access invalid considering #{params[:id]}"
      redirect_to animal_display_path, notice: "Invalid considering"
    end
end
