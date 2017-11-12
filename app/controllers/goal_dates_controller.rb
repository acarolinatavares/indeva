class GoalDatesController < ApplicationController
  before_action :set_goal_date, only: [:show, :edit, :update, :destroy]

  # GET /goal_dates
  # GET /goal_dates.json
  def index
    @goal_dates = GoalDate.all
  end

  # GET /goal_dates/1
  # GET /goal_dates/1.json
  def show
  end

  # GET /goal_dates/new
  def new
    @goal_date = GoalDate.new
  end

  # GET /goal_dates/1/edit
  def edit
  end

  # POST /goal_dates
  # POST /goal_dates.json
  def create
    @goal_date = GoalDate.new(goal_date_params)

    respond_to do |format|
      if @goal_date.save
        format.html { redirect_to @goal_date, notice: 'Goal date was successfully created.' }
        format.json { render :show, status: :created, location: @goal_date }
      else
        format.html { render :new }
        format.json { render json: @goal_date.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /goal_dates/1
  # PATCH/PUT /goal_dates/1.json
  def update
    respond_to do |format|
      if @goal_date.update(goal_date_params)
        format.html { redirect_to @goal_date, notice: 'Goal date was successfully updated.' }
        format.json { render :show, status: :ok, location: @goal_date }
      else
        format.html { render :edit }
        format.json { render json: @goal_date.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /goal_dates/1
  # DELETE /goal_dates/1.json
  def destroy
    @goal_date.destroy
    respond_to do |format|
      format.html { redirect_to goal_dates_url, notice: 'Goal date was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_goal_date
      @goal_date = GoalDate.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def goal_date_params
      params.require(:goal_date).permit(:day, :value, :goal_id)
    end
end
