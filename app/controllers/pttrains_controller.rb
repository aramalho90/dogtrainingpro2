class PttrainsController < ApplicationController
  before_action :set_pttrain, only: %i[ show edit update destroy ]

  # GET /pttrains or /pttrains.json
  def index
    @q = Pttrain
                .joins("LEFT JOIN dogs ON pttrains.dog_id = dogs.id")
                .joins("LEFT JOIN ptmaps ON pttrains.ptmap_id = ptmaps.id")
                .where("status in ('A decorrer','A realizar passagens')")
                .select("dogs.id,pttrains.id,dogs.name,mon1,mon2,mon3,mon4,mon5,mon6,ptmaps.day")
                .order("inscr_date ASC").ransack(params[:q])

    @pttrains = @q.result().paginate(page: params[:page], per_page: 12)
  end

  # GET /pttrains/1 or /pttrains/1.json
  def show
  end

  # GET /pttrains/new
  def new
    @pttrain = Pttrain.new
    @dog =  Dog.find(params[:dog])
  end

  # GET /pttrains/1/edit
  def edit
  end

  # POST /pttrains or /pttrains.json
  def create
    @pttrain = Pttrain.new(pttrain_params)

    respond_to do |format|
      if @pttrain.save
        format.html { redirect_to dog_url(@pttrain.dog_id) }
        format.json { render :show, status: :created, location: @pttrain }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @pttrain.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /pttrains/1 or /pttrains/1.json
  def update
    respond_to do |format|
      if @pttrain.update(pttrain_params)
        format.html { redirect_to pttrains_url }
        format.json { render :show, status: :ok, location: @pttrain }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @pttrain.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /pttrains/1 or /pttrains/1.json
  def destroy
    @pttrain.destroy
    respond_to do |format|
      format.html { grouptrains_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_pttrain
      @pttrain = Pttrain.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def pttrain_params
      params.require(:pttrain).permit(:test1, :test2, :test3, :test4, :test5, :inscr_paid, :status, :obs, :ptmap_id, :dog_id, :inscr_date, :mon1, :mon2, :mon3, :mon4, :mon5, :mon6)
    end
end
