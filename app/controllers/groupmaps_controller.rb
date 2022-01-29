class GroupmapsController < ApplicationController
  before_action :set_groupmap, only: %i[ show edit update destroy ]

  # GET /groupmaps or /groupmaps.json
  def index
    @groupmaps = Groupmap.order("id ASC").all
  end

  # GET /groupmaps/1 or /groupmaps/1.json
  def show
  end

  # GET /groupmaps/new
  def new
    @groupmap = Groupmap.new
  end

  # GET /groupmaps/1/edit
  def edit
  end

  # POST /groupmaps or /groupmaps.json
  def create
    @groupmap = Groupmap.new(groupmap_params)

    respond_to do |format|
      if @groupmap.save
        format.html { redirect_to @groupmap, notice: "Groupmap was successfully created." }
        format.json { render :show, status: :created, location: @groupmap }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @groupmap.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /groupmaps/1 or /groupmaps/1.json
  def update
    respond_to do |format|
      if @groupmap.update(groupmap_params)
        format.html { redirect_to groupmaps_url }
        format.json { render :show, status: :ok, location: @groupmap }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @groupmap.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /groupmaps/1 or /groupmaps/1.json
  def destroy
    @groupmap.destroy
    respond_to do |format|
      format.html { redirect_to groupmaps_url, notice: "Groupmap was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_groupmap
      @groupmap = Groupmap.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def groupmap_params
      params.require(:groupmap).permit(:time, :limit)
    end
end
