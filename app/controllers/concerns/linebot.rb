require 'line/bot'

module Linebot
  extend ActiveSupport::Concern

  @channel_secret = nil
  @channel_access_token = nil
  @client = nil

  def set_line_client channel_secret, channel_access_token
    @channel_secret = channel_secret
    @channel_access_token = channel_access_token
    Line::Bot::Client.new { |config|
        config.channel_secret = @channel_secret
        config.channel_token = @channel_access_token
    }
  end

  def only_push_text_message client, user_id, text
    message = {
      type: 'text',
      text: text
    }
    client.push_message(user_id, message)
  end

  private

  PushMessageHost = "https://api.line.me/v2/bot/message/push"

end
