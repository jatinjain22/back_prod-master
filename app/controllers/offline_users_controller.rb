class OfflineUsersController < ApplicationController
  before_action :authenticate_ops_user!
  before_action :set_offline_user, only: [:show, :edit, :update, :destroy]
   
  # GET /offline_users
  # GET /offline_users.json
  def index
    @offline_users = OfflineUser.all
  end

  # GET /offline_users/1
  # GET /offline_users/1.json
  def show
  end

  # GET /offline_users/new
  def new
    @offline_user = OfflineUser.new
  end

  # GET /offline_users/1/edit
  def edit
  end

  # POST /offline_users
  # POST /offline_users.json
  def create
    @offline_user = OfflineUser.new(offline_user_params)

    respond_to do |format|
      if @offline_user.save
        format.html { redirect_to @offline_user, notice: 'Offline user was successfully created.' }
        format.json { render :show, status: :created, location: @offline_user }
      else
        format.html { render :new }
        format.json { render json: @offline_user.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /offline_users/1
  # PATCH/PUT /offline_users/1.json
  def update
    respond_to do |format|
      if @offline_user.update(offline_user_params)
        format.html { redirect_to @offline_user, notice: 'Offline user was successfully updated.' }
        format.json { render :show, status: :ok, location: @offline_user }
      else
        format.html { render :edit }
        format.json { render json: @offline_user.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /offline_users/1
  # DELETE /offline_users/1.json
  def destroy
    @offline_user.destroy
    respond_to do |format|
      format.html { redirect_to offline_users_url, notice: 'Offline user was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_offline_user
      @offline_user = OfflineUser.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def offline_user_params
      params.require(:offline_user).permit(:name, :address, :contactno)
    end
end
