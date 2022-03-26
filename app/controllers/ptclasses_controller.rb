class PtclassesController < ApplicationController
  before_action :set_ptclass, only: %i[ show edit update destroy ]

  # GET /ptclasses or /ptclasses.json
  def index
    @ptclasses = Ptclass.all
  end

  def home
  end

  # GET /ptclasses/1 or /ptclasses/1.json
  def show
  end

  # GET /ptclasses/new
  def new
    @ptclass = Ptclass.new
    @date_of_class = params[:q]

    @ptclasses = Ptclass.where(class_date: @date_of_class)
  end

  # GET /ptclasses/1/edit
  def edit
  end

  # POST /ptclasses or /ptclasses.json
  def create
    @ptclass = Ptclass.new(ptclass_params)

    respond_to do |format|
      if @ptclass.save
        format.html { redirect_back fallback_location: root_path }
        format.json { render :show, status: :created, location: @ptclass }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @ptclass.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /ptclasses/1 or /ptclasses/1.json
  def update
    respond_to do |format|
      if @ptclass.update(ptclass_params)
        format.html { redirect_back fallback_location: root_path }
        format.json { render :show, status: :ok, location: @ptclass }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @ptclass.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /ptclasses/1 or /ptclasses/1.json
  def destroy
    @ptclass.destroy

    respond_to do |format|
      format.html { redirect_back fallback_location: root_path }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_ptclass
      @ptclass = Ptclass.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def ptclass_params
      params.require(:ptclass).permit(:class_date, :dog_id, :dog_name, :obs)
    end
end
