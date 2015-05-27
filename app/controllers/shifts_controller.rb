class ShiftsController < ApplicationController
  before_action :set_shift, only: [:show, :edit, :update, :destroy]

  # GET /shifts
  # GET /shifts.json
  def index
    case params[:q]
    when "1"
      @shifts = Shift.all
                     .where(day: Date.today.beginning_of_month..Date.today.end_of_month)
                     .order(day: :asc)
    when "2"
      @shifts = Shift.all.where(day: Date.today)
    when "3"
      @shifts = Shift.all
                     .where(day: Date.today.beginning_of_week(start_day = :saturday)..Date.today.end_of_week(start_day = :saturday))
                     .order(day: :asc)
    when "4"
      @shifts = Shift.all
                     .where(day: Date.today.last_month.beginning_of_month..Date.today.last_month.end_of_month)
                     .order(day: :asc)
    when "5"
      @shifts = Shift.all
                     .where(day: Date.today.last_week.beginning_of_week..Date.today.last_week.end_of_week)
                     .order(day: :asc)
    when "6"
      @shifts = Shift.all
                     .where(day: Date.yesterday)
    else
      @shifts = Shift.all.order(day: :asc)
    end
  end

  # GET /shifts/1
  # GET /shifts/1.json
  def show
  end

  # GET /shifts/new
  def new
    @shift = Shift.new
  end

  # GET /shifts/1/edit
  def edit
  end

  # POST /shifts
  # POST /shifts.json
  def create
    @shift = Shift.new(shift_params)

    respond_to do |format|
      if @shift.save
        format.html { redirect_to @shift, notice: 'Shift was successfully created.' }
        format.json { render :show, status: :created, location: @shift }
        format.js
      else
        format.html { render :new }
        format.json { render json: @shift.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /shifts/1
  # PATCH/PUT /shifts/1.json
  def update
    respond_to do |format|
      if @shift.update(shift_params)
        format.html { redirect_to @shift, notice: 'Shift was successfully updated.' }
        format.json { render :show, status: :ok, location: @shift }
      else
        format.html { render :edit }
        format.json { render json: @shift.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /shifts/1
  # DELETE /shifts/1.json
  def destroy
    @shift.destroy
    respond_to do |format|
      format.html { redirect_to shifts_url, notice: 'Shift was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_shift
      @shift = Shift.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def shift_params
      params.require(:shift).permit(:day, :desc, :commit, :hours)
    end
end
