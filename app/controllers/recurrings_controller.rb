class RecurringsController < ApplicationController
  #before_action :authenticate_ops_user!
  before_action :set_recurring, only: [:show, :edit, :update, :destroy]

  # GET /recurrings
  # GET /recurrings.json
  def index
    @recurrings = Recurring.all
  end

  # GET /recurrings/1
  # GET /recurrings/1.json
  def show
  end

  # GET /recurrings/new
  def new
    @recurring = Recurring.new
  end

  # GET /recurrings/1/edit
  def edit
  end

  # POST /recurrings
  # POST /recurrings.json
  def create
    @recurring = Recurring.new(recurring_params)

    #respond_to do |format|
      if @recurring.save
         render json: {
                 status: 'success',
                 data: @recurring
             }, status: 201
      else
       render json: {
                 status: 'error',
                 errors: ["Missing `confirm_success_url` param."],
                 message: [:unprocessable_entity],
             }, status: 400 
      end
  end

  # PATCH/PUT /recurrings/1
  # PATCH/PUT /recurrings/1.json
  def update
    #respond_to do |format|
    @recurring = Recurring.find(params[:id])
      if @recurring.update(recurring_params)
         render json: {
                 status: 'success',
                 data: @recurring
             }, status: 201
      else
        render json: {
                 status: 'error',
                 errors: ["Missing `confirm_success_url` param."],
                 message: [:unprocessable_entity],
             }, status: 400 
      end
  end

  # DELETE /recurrings/1
  # DELETE /recurrings/1.json
  def destroy
          @recurring = Recurring.find(params[:id])

    @recurring.destroy
    #respond_to do |format|
     if @feedback.present?
      @feedback.destroy
      #format.html { redirect_to feedbacks_url, notice: 'Feedback was successfully destroyed.' }
      #format.json { head :no_content }
    end
    redirect_to root_url    
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_recurring
      @recurring = Recurring.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def recurring_params
      params.require(:recurring).permit(:user_id, :recurring_flag, :lastdate)
    end
end
