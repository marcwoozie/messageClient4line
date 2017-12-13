class MessagesController < ApplicationController
  before_action :set_message, only: [:show, :edit, :update, :destroy]
  protect_from_forgery with: :null_session, only: :receive

  # GET /messages
  # GET /messages.json
  def index
    @messages = Message.all
  end

  # GET /messages/1
  # GET /messages/1.json
  def show
  end

  # GET /messages/new
  def new
    @message = Message.new
  end

  # GET /messages/1/edit
  def edit
  end

  # POST /messages
  # POST /messages.json
  def create
    @message = Message.new(message_params)

    respond_to do |format|
      if @message.save
        format.html { redirect_to @message, notice: 'Message was successfully created.' }
        format.json { render :show, status: :created, location: @message }
      else
        format.html { render :new }
        format.json { render json: @message.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /messages/1
  # PATCH/PUT /messages/1.json
  def update
    respond_to do |format|
      if @message.update(message_params)
        format.html { redirect_to @message, notice: 'Message was successfully updated.' }
        format.json { render :show, status: :ok, location: @message }
      else
        format.html { render :edit }
        format.json { render json: @message.errors, status: :unprocessable_entity }
      end
    end
  end

  def receive
    unless is_validate_signature
      return render plain: "NO", status: 200
    end

    event = params["events"][0]
    event_type = event["type"]
    replyToken = event["replyToken"]

    case event_type
    when "message"
      input_text = event["message"]["text"]
      output_text = input_text
    end

    channel = Channel.first
    client = Classes::Line::Client.new channel.channel_secret, channel.access_token
    res = client.reply_message(replyToken, output_text)
    
    user = User.where(:line_user_id => event['source']['userId']).first
    if user
      @message = Message.new({
        :user_id => user.id,
        :channel_id => channel.id,
        :text => output_text
      })
    end

    render plain: "OK", status: 200
  end

  # DELETE /messages/1
  # DELETE /messages/1.json
  def destroy
    @message.destroy
    respond_to do |format|
      format.html { redirect_to messages_url, notice: 'Message was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_message
      @message = Message.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def message_params
      params.require(:message).permit(:user_id, :channel_id, :text)
    end

    def is_validate_signature
      signature = request.headers["X-LINE-Signature"]
      http_request_body = request.raw_post
      channel = Channel.first
      hash = OpenSSL::HMAC::digest(OpenSSL::Digest::SHA256.new, channel.channel_secret, http_request_body)
      signature_answer = Base64.strict_encode64(hash)
      signature == signature_answer
    end

end
