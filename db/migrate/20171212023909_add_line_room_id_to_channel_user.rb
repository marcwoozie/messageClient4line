class AddLineRoomIdToChannelUser < ActiveRecord::Migration[5.1]
  def change
    add_column :channel_users, :line_room_id, :string, null: :true
  end
end
