class GrouptrainsController < ApplicationController
  before_action :set_grouptrain, only: %i[ show edit update destroy ]

  # GET /grouptrains or /grouptrains.json
  def index
    grouptrains = Grouptrain.select(:id, "'Treino de grupo' as type", :inscr_date, :status, :obs, :dog_id)
    pttrains = Pttrain.select(:id, "'Treino PT' as type", :inscr_date, :status, :obs, :dog_id)

    union = Grouptrain.connection.unprepared_statement do
        "((#{grouptrains.to_sql}) UNION (#{pttrains.to_sql})) AS grouptrains"
    end

    @q = Grouptrain
           .select('*')
           .from(union)
           .ransack(params[:q])

    @trains = @q.result().paginate(page: params[:page], per_page: 10)

  end

  # GET /grouptrains/1 or /grouptrains/1.json
  def show
  end

  # GET /grouptrains/new
  def new
    @grouptrain = Grouptrain.new
    @dog =  Dog.find(params[:dog])
  end

  # GET /grouptrains/1/edit
  def edit
  end

  # POST /grouptrains or /grouptrains.json
  def create
    @grouptrain = Grouptrain.new(grouptrain_params)

    respond_to do |format|
      if @grouptrain.save
        format.html { redirect_to dog_url(@grouptrain.dog_id) }
        format.json { render :show, status: :created, location: @grouptrain }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @grouptrain.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /grouptrains/1 or /grouptrains/1.json
  def update
    respond_to do |format|
      if @grouptrain.update(grouptrain_params)
        format.html { redirect_to dog_url(@grouptrain.dog_id)}
        format.json { render :show, status: :ok, location: @grouptrain }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @grouptrain.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /grouptrains/1 or /grouptrains/1.json
  def destroy
    @grouptrain.destroy
    respond_to do |format|
      format.html { redirect_to grouptrains_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_grouptrain
      @grouptrain = Grouptrain.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def grouptrain_params
      params.require(:grouptrain).permit(:teoric1, :teoric2, :inscr_paid, :teoric_paid, :status, :groupmap_id, :obs, :dog_id)
    end
end
