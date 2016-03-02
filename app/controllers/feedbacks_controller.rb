 class FeedbacksController < ApplicationController
  #before_action :set_feedback, only: [:show, :edit, :update, :destroy]

  # GET /feedbacks
  # GET /feedbacks.json
  def index
    @feedbacks = Feedback.all
  end

  # GET /feedbacks/1
  # GET /feedbacks/1.json
  def show
  end

  # GET /feedbacks/new
  def new
    @feedback = Feedback.new
  end

  # GET /feedbacks/1/edit
  def edit
  end

  # POST /feedbacks
  # POST /feedbacks.json
  def create
    @feedback = Feedback.new(feedback_params)
    #@service_requests = ServiceRequest.find(params[:id])
    
    #respond_to do |format|
      if @feedback.save
        render json: {
                 status: 'success',
                 data: @feedback
             }, status: 201
      else
       render json: {
                 status: 'error',
                 errors: ["Missing `confirm_success_url` param."],
                 message: [:unprocessable_entity],
             }, status: 400 
      end
    end
 

  # PATCH/PUT /feedbacks/1
  # PATCH/PUT /feedbacks/1.json
  def update
    #respond_to do |format|
      if @feedback.update(feedback_params)
        render json: {
                 status: 'success',
                 data: @feedback
             }, status: 201
      else
        render json: {
                 status: 'error',
                 errors: ["Missing `confirm_success_url` param."],
                 message: [:unprocessable_entity],
             }, status: 400 
      end
    end
  

  # DELETE /feedbacks/1
  # DELETE /feedbacks/1.json
  def destroy
    @feedback = Feedback.find(params[:id])
    if @feedback.present?
      @feedback.destroy
      #format.html { redirect_to feedbacks_url, notice: 'Feedback was successfully destroyed.' }
      #format.json { head :no_content }
    end
    redirect_to root_url    
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_feedback
      @feedback = Feedback.find(params[:id])
    end
    

    # Never trust parameters from the scary internet, only allow the white list through.
    def feedback_params
      params.require(:feedback).permit(:feedback, :rating, :request_id)
    end
end
