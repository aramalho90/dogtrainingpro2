class DogsController < ApplicationController
  before_action :set_dog, only: %i[ show edit update destroy ]

  # GET /dogs or /dogs.json
  def index
    @q = Dog.ransack(params[:q])
    @dogs = @q.result().paginate(page: params[:page], per_page: 10)
    end

  # GET /dogs/1 or /dogs/1.json
  def show
    @dog = Dog.find(params[:id])
    @g = @dog.grouptrains.ransack(params[:q])
    @grouptrains = @g.result().paginate(page: params[:grouptrains_page], per_page: 5)

    @p = @dog.pttrains.ransack(params[:q])
    @pttrains = @p.result().paginate(page: params[:pttrains_page], per_page: 5)

  end

  # GET /dogs/new
  def new
    @dog = Dog.new
  end

  # GET /dogs/1/edit
  def edit
  end

  # POST /dogs or /dogs.json
  def create
    @dog = Dog.new(dog_params)

    respond_to do |format|
      if @dog.save
        format.html { redirect_to dog_url(@dog)}
        format.json { render :show, status: :created, location: @dog }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @dog.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /dogs/1 or /dogs/1.json
  def update
    respond_to do |format|
      if @dog.update(dog_params)
        format.html { redirect_to dog_url(@dog)}
        format.json { render :show, status: :ok, location: @dog }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @dog.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /dogs/1 or /dogs/1.json
  def destroy
    @dog.destroy

    respond_to do |format|
      format.html { redirect_to dogs_url}
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_dog
      @dog = Dog.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def dog_params
      params.require(:dog).permit(:name, :sex, :dob, :breed, :color, :weight, :chip, :vaccines, :canil, :allergies, :obs, :picture, :owner_id, :owner_name)
    end
end
