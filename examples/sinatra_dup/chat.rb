# frozen_string_literal: true

require "litecable"

# Sample chat application
module Chats
  class Connection < LiteCable::Connection::Base # :nodoc:
    identified_by :sid
    @@connections_count = 0
    @@lock_mech = Mutex.new

    def connect
      # @user = cookies["user"]
      # @sid = '1234'
      @sid = request.params["sid"]
      # reject_unauthorized_connection unless @user
      $stdout.puts "#{@user} connected"
      @@lock_mech.synchronize { @@connections_count += 1 }
    end

    def disconnect
      @@lock_mech.synchronize { @@connections_count += 1 }
      $stdout.puts "#{@user} disconnected"
    end
  end

  class Channel < LiteCable::Channel::Base # :nodoc:
    identifier :chat

    def subscribed
      #reject unless chat_id
      stream_from "chat_1"
    end

    # def speak(data)
    #   LiteCable.broadcast "chat_1", user: user, message: data["message"], sid: sid
    # end
    # 
    # private
    # 
    #def chat_id
    #  params.fetch("id")
    #end
  end
end
