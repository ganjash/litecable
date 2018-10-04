# frozen_string_literal: true

require "sinatra"
require "sinatra/cookies"

CABLE_URL = "ws://localhost:9292/cable"

class App < Sinatra::Application # :nodoc:
  set :public_folder, 'assets'

  enable :sessions
  set :session_secret, 'my_secrets'

  # get '/' do
  #   binding.pry
  #   puts 'in root'
  # end

  #  get '/sign_in' do
  #    slim :login
  #  end

    post '/message' do
      message = params['message']
      LiteCable.broadcast "chat_1", user: 'BOT', message: message, sid: '1234'
      'OK'
    end

    get '/test' do
      binding.pry
      'OK'
    end

    get '/subscribers' do
      puts '*******'
      p Chats::Connection.class_variable_get(:@@connections_count)
      puts '*******'
      'OK'
    end

  # post '/rooms' do
  #   if params['id']
  #     redirect "/rooms/#{params['id']}"
  #   else
  #     slim :index
  #   end
  # end

  # get '/rooms/:id' do
  #   if session[:user]
  #     @room_id = params['id']
  #     @user = session[:user]
  #     slim :room
  #   else
  #     slim :login
  #   end
  # end
end
