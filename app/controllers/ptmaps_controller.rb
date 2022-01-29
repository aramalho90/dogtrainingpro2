class PtmapsController < ApplicationController
  before_action :set_ptmap, only: %i[ show edit update destroy ]

  # GET /ptmaps or /ptmaps.json
  def index
    @ptmaps = Ptmap.order("id ASC").all
  end

  # GET /ptmaps/1 or /ptmaps/1.json
  def show
  end

  # GET /ptmaps/new
  def new
    @ptmap = Ptmap.new
  end

  # GET /ptmaps/1/edit
  def edit
  end

  # POST /ptmaps or /ptmaps.json
  def create
    @ptmap = Ptmap.new(ptmap_params)

    respond_to do |format|
      if @ptmap.save
        format.html { redirect_to @ptmap }
        format.json { render :show, status: :created, location: @ptmap }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @ptmap.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /ptmaps/1 or /ptmaps/1.json
  def update
    respond_to do |format|
      if @ptmap.update(ptmap_params)
        format.html { redirect_to ptmaps_url }
        format.json { render :show, status: :ok, location: @ptmap }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @ptmap.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /ptmaps/1 or /ptmaps/1.json
  def destroy
    @ptmap.destroy
    respond_to do |format|
      format.html { redirect_to ptmaps_url, notice: "Ptmap was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_ptmap
      @ptmap = Ptmap.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def ptmap_params
      params.require(:ptmap).permit(:day, :limit)
    end
end
