class GroupclassesController < ApplicationController
  before_action :set_groupclass, only: %i[ show edit update destroy ]

  # GET /groupclasses or /groupclasses.json
  def index
    groupclasses = Groupclass.select(:id, "'Treino de grupo' as type", :class_date, :obs, :dog_id)
    ptclasses = Ptclass.select(:id, "'Treino PT' as type", :class_date, :obs, :dog_id)

    union = Groupclass.connection.unprepared_statement do
        "((#{groupclasses.to_sql}) UNION (#{ptclasses.to_sql})) AS groupclasses"
    end

    @q = Groupclass
           .select('*')
           .from(union)
           .order('class_date')
           .ransack(params[:q])

    @classes = @q.result().paginate(page: params[:page], per_page: 10)

  end

  def home
  end

  # GET /groupclasses/1 or /groupclasses/1.json
  def show
  end

  # GET /groupclasses/new
  def new
    @groupclass = Groupclass.new
    @date_of_class = params[:q]

    @groupclasses = Groupclass.where(class_date: @date_of_class)
  end

  # GET /groupclasses/1/edit
  def edit
  end

  # POST /groupclasses or /groupclasses.json
  def create
    @groupclass = Groupclass.new(groupclass_params)

    respond_to do |format|
      if @groupclass.save
        format.html { redirect_back fallback_location: root_path }
        format.json { render :show, status: :created, location: @groupclass }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @groupclass.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /groupclasses/1 or /groupclasses/1.json
  def update
    respond_to do |format|
      if @groupclass.update(groupclass_params)
        format.html { redirect_back fallback_location: root_path }
        format.json { render :show, status: :ok, location: @groupclass }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @groupclass.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /groupclasses/1 or /groupclasses/1.json
  def destroy
    @groupclass.destroy

    respond_to do |format|
      format.html { redirect_back fallback_location: root_path }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_groupclass
      @groupclass = Groupclass.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def groupclass_params
      params.require(:groupclass).permit(:class_date, :dog_id, :dog_name, :obs)
    end
end
