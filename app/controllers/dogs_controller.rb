class DogsController < ApplicationController
  before_action :set_dog, only: [:show, :edit, :update, :destroy]

  # GET /dogs
  # GET /dogs.json
  def index
   #@dogs = Dog.all
   @q = Dog.ransack(params[:q])
   @dogs = @q.result().paginate(page: params[:page], per_page: 15)

  end
  # GET /dogs/1
  # GET /dogs/1.json
  def show
    @dog = Dog.find(params[:id])
    @q = @dog.bookings.ransack(params[:q])
    @bookings = @q.result().paginate(page: params[:page], per_page: 10)


   @total = Booking.find_by_sql(["SELECT round(sum(q.total),0) as total FROM
                                                 ( SELECT case when changed_price is null or changed_price=0 then (price * (end_date - start_date)) else changed_price end as total
                                                      from bookings b join dogs d on b.dog_id = d.id
                                                           where d.id = ?) as q",params[:id]])
  end

  # GET /dogs/new
  def new
    @dog = Dog.new
  end

  # GET /dogs/1/edit
  def edit
  end

  # POST /dogs
  # POST /dogs.json
  def create
    @dog = Dog.new(dog_params)

    respond_to do |format|
      if @dog.save
        format.html { redirect_to @dog}
        format.json { render :show, status: :created, location: @dog }
      else
        format.html { render :new }
        format.json { render json: @dog.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /dogs/1
  # PATCH/PUT /dogs/1.json
  def update
    respond_to do |format|
      if @dog.update(dog_params)
        format.html { redirect_to @dog}
        format.json { render :show, status: :ok, location: @dog }
      else
        format.html { render :edit }
        format.json { render json: @dog.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /dogs/1
  # DELETE /dogs/1.json
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
      params.require(:dog).permit(:name, :sex, :dob, :breed, :color, :weight, :chip, :vaccines, :canil, :allergies, :obs, :picture, :ownername, :contact, :email, :nif, :address, :city, :zipcode, :rabies)
    end
end
