require 'line/bot'

module Classes::Line
  class Client

    @channel_secret = nil
    @channel_access_token = nil
    @client = nil
    @sender_id = nil

    def initialize channel_secret, channel_access_token
      @channel_secret = channel_secret
      @channel_access_token = channel_access_token
      @client = Line::Bot::Client.new { |config|
          config.channel_secret = @channel_secret
          config.channel_token = @channel_access_token
      }
    end

    def set_sender_id line_user_id
      @sender_id = line_user_id
    end

    def only_push_text_message text
      return false if @client.nil?
      return false if @sender_id.nil?
      message = {
        type: 'text',
        text: text
      }
      @client.push_message(@sender_id, message)
    end

    def reply_message reply_token, text
      message = {
        type: 'text',
        text: text
      }      
      @client.reply_message(reply_token, message)
    end

    def push_location title, address, lat, lng
      return false if @client.nil?
      return false if @sender_id.nil?
      message = {
        type: "location",
        title: title,
        address: address,
        latitude: lat,
        longitude: lng
      }
      @client.push_message(@sender_id, message)      
    end

    def push_image original_content_url, preview_img_url
      return false if @client.nil?
      return false if @sender_id.nil?
      message = {
        type: "image",
        originalContentUrl: original_content_url,
        previewImageUrl: preview_img_url
      }
      @client.push_message(@sender_id, message)      
    end

    def push_sticker package_id, sticker_id
      return false if @client.nil?
      return false if @sender_id.nil?
      message = {
        type: "sticker",
        packageId: package_id,
        stickerId: sticker_id
      }
      @client.push_message(@sender_id, message)      
    end

  end
end