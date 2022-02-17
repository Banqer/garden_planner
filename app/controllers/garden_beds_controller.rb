class GardenBedsController < ApplicationController
  before_action :set_garden_bed, only: %i[ show edit update destroy ]

  # GET /garden_beds or /garden_beds.json
  def index
    @garden_beds = GardenBed.all
  end

  # GET /garden_beds/1 or /garden_beds/1.json
  def show
  end

  # GET /garden_beds/new
  def new
    @garden_bed = GardenBed.new
  end

  # GET /garden_beds/1/edit
  def edit
  end

  # POST /garden_beds or /garden_beds.json
  def create
    @garden_bed = GardenBed.new(garden_bed_params)

    respond_to do |format|
      if @garden_bed.save
        format.html { redirect_to garden_bed_url(@garden_bed), notice: "Garden bed was successfully created." }
        format.json { render :show, status: :created, location: @garden_bed }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @garden_bed.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /garden_beds/1 or /garden_beds/1.json
  def update
    respond_to do |format|
      if @garden_bed.update(garden_bed_params)
        format.html { redirect_to garden_bed_url(@garden_bed), notice: "Garden bed was successfully updated." }
        format.json { render :show, status: :ok, location: @garden_bed }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @garden_bed.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /garden_beds/1 or /garden_beds/1.json
  def destroy
    @garden_bed.destroy

    respond_to do |format|
      format.html { redirect_to garden_beds_url, notice: "Garden bed was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_garden_bed
      @garden_bed = GardenBed.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def garden_bed_params
      params.require(:garden_bed).permit(:name, :last_weeded_at)
    end
end
