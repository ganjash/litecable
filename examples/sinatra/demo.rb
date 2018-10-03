# frozen_string_literal: true

require "litecable"

# Sample chat application
module Demos
  class Connection < LiteCable::Connection::Base # :nodoc:
    identified_by :user

    def connect
      @user = request.params["user"]
      $stdout.puts "#{@user} connected"
    end

    def disconnect
      $stdout.puts "#{@user} disconnected"
    end
  end

  class Channel < LiteCable::Channel::Base # :nodoc:
    identifier :demo

    def subscribed
      #reject unless chat_id
      stream_from "chat_1"
    end

    def speak(data)
      LiteCable.broadcast "chat_1", user: user, message: data["message"], sid: sid
    end

    private

    #def chat_id
    #  params.fetch("id")
    #end
  end
end
