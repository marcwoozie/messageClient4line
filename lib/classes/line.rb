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

  end
end