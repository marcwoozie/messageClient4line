class ChannelUsersController < ApplicationController
  before_action :set_channel_user, only: [:show, :edit, :update, :destroy]

  # GET /channel_users
  # GET /channel_users.json
  def index
    @channel_users = ChannelUser.all
  end

  # GET /channel_users/1
  # GET /channel_users/1.json
  def show
  end

  # GET /channel_users/new
  def new
    @channel_user = ChannelUser.new
  end

  # GET /channel_users/1/edit
  def edit
  end

  # POST /channel_users
  # POST /channel_users.json
  def create
    @channel_user = ChannelUser.new(channel_user_params)

    respond_to do |format|
      if @channel_user.save
        format.html { redirect_to @channel_user, notice: 'Channel user was successfully created.' }
        format.json { render :show, status: :created, location: @channel_user }
      else
        format.html { render :new }
        format.json { render json: @channel_user.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /channel_users/1
  # PATCH/PUT /channel_users/1.json
  def update
    respond_to do |format|
      if @channel_user.update(channel_user_params)
        format.html { redirect_to @channel_user, notice: 'Channel user was successfully updated.' }
        format.json { render :show, status: :ok, location: @channel_user }
      else
        format.html { render :edit }
        format.json { render json: @channel_user.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /channel_users/1
  # DELETE /channel_users/1.json
  def destroy
    @channel_user.destroy
    respond_to do |format|
      format.html { redirect_to channel_users_url, notice: 'Channel user was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_channel_user
      @channel_user = ChannelUser.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def channel_user_params
      params.require(:channel_user).permit(:channel_id, :user_id)
    end
end
